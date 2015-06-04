#!/bin/zsh

################################################################################
#                                                                              #
# Various greeting information - Needs /.bash_functions                        #
#                                                                              #
# binaryanomaly - v0.1                                                         #
#                                                                              #
################################################################################


source ~/git/dotfiles/zsh/bash_print_functions.sh


__print_hostname ()
{
    local HOSTNAME=$(hostname)
    local STR_HOSTNAME="-= $HOSTNAME =-"

    if [[ -x /usr/bin/figlet ]]; then
        #Print hostename with figlets
        __print_ascii_art "$STR_HOSTNAME"
    else
        __print_centered_string "$STR_HOSTNAME" "0"
    fi

    #printf "${NORMAL}\n"
}

__print_uptime ()
{
    local HOSTNAME="$(uptime -p)"

    __print_centered_string "$HOSTNAME" "0"

    __print_line
}


__print_sysinfo ()
{
    local SYS_INFO="$(uname -srmo)"
    #local SYS_INFO="-= $SYS_INFO =-"

    #printf ${ORANGE}
    __print_centered_string "$SYS_INFO" "0"

    #printf "${NORMAL}\n"
    __print_line
}


__print_diskinfo ()
{
    # disk usage, minus def and swap
    local DISK_INFO="$(df -h -x tmpfs -x devtmpfs -x vfat -T)"
    
    #printf ${POWDER_BLUE}
    __print_centered_multiline "$DISK_INFO" "0"
    # printf "%s\n" "$DISK_INFO" | boxes -d ada-box -ph8v1

    #printf "${NORMAL}\n"
    __print_line
}

__print_lastlogins ()
{
    # LAST_LOGINS=$(last -in 3 -ad)
    # printf "%s\n" "$LAST_LOGINS" | boxes -d ada-box -ph8v1
    local LAST_LOGINS="$(last -in 3 -ad)"
    #local linecount=$(printf "%s\n" "$LAST_LOGINS" | grep -c '^')

    #printf ${GREY}
    __print_centered_multiline "$LAST_LOGINS" "0"

    #printf "${NORMAL}\n"
    __print_line
}


# Call functions
#__print_hostname

__print_sysinfo
__print_uptime

__print_diskinfo

#__print_lastlogins

