# shared functions and constants

tpm_plugins_variable_name="@tpm_plugins"
SHARED_TPM_PATH=""

# sets a "global variable" for the current file
shared_set_tpm_path_constant() {
	SHARED_TPM_PATH=$(tmux show-environment -g TMUX_PLUGIN_MANAGER_PATH | cut -f2 -d=)
}

shared_get_tpm_plugins_list() {
	tmux show-option -gqv "$tpm_plugins_variable_name"
}

# Allowed plugin name formats:
# 1. "git://github.com/user/plugin_name.git"
# 2. "user/plugin_name"
shared_plugin_name() {
	local plugin="$1"
	# get only the part after the last slash, e.g. "plugin_name.git"
	local plugin_basename="$(basename "$plugin")"
	# remove ".git" extension (if it exists) to get only "plugin_name"
	local plugin_name="${plugin_basename%.git}"
	echo "$plugin_name"
}

shared_plugin_path() {
	local plugin=$1
	local plugin_name=$(shared_plugin_name "$plugin")
	echo "$SHARED_TPM_PATH$plugin_name/"
}

# TMUX messaging is weird. You only get a nice clean pane if you do it with
# `run-shell` command.
echo_message() {
	local message="$1"
	tmux run-shell "echo '$message'"
}

reload_tmux_environment() {
	tmux source-file ~/.tmux.conf >/dev/null 2>&1
}

plugin_already_installed() {
	local plugin="$1"
	local plugin_path="$(shared_plugin_path "$plugin")"
	cd "$plugin_path" &&
		git remote >/dev/null 2>&1
}

end_message() {
	echo_message ""
	echo_message "TMUX environment reloaded."
	echo_message ""
	echo_message "Done, press ENTER to continue."
}

# Ensures a message is displayed for 5 seconds in tmux prompt.
# Does not override the 'display-time' tmux option.
display_message() {
	local message="$1"

	# display_duration defaults to 5 seconds, if not passed as an argument
	if [ "$#" -eq 2 ]; then
		local display_duration="$2"
	else
		local display_duration="5000"
	fi

	# saves user-set 'display-time' option
	local saved_display_time=$(get_tmux_option "display-time" "750")

	# sets message display time to 5 seconds
	tmux set-option -gq display-time "$display_duration"

	# displays message
	tmux display-message "$message"

	# restores original 'display-time' value
	tmux set-option -gq display-time "$saved_display_time"
}
