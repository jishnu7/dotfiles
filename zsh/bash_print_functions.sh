#!/bin/zsh

################################################################################
#                                                                              #
# Helper functions for centered printing of single-line and multi-line vars    #
#                                                                              #
# binaryanomaly - v0.1                                                         #
#                                                                              #
################################################################################

__print_line ()
{
    local line="--------------------------------------------------------------------------------"
    
    printf "${GREY}"
    __print_centered_string "$line" "0"

    if [ "$1" = true ]; then
        printf "\n"
    fi
}

__print_ascii_art ()
{
    printf "%s\n" "$1" | figlet -w $COLUMNS -c
}


__print_centered_string ()
{
    local c_string="$1"
    local mid=$(((${#c_string}+$COLUMNS)/2))
    local leftspace=$((${mid}-${#c_string}))

    printf "%-*s%s\n" $leftspace " " "$c_string"
}


# Args: stringvar, offset
__print_centered_multiline ()
{
    # Find longest string
    local strlen=0
    local offset=$2
    while IFS= read -r line
    do
        # Store length
        if [ ${#line} -gt $strlen ]; then
            strlen="${#line}"
        fi
    done <<< "$1"

    # Apply offset
    strlen=$(($strlen-$offset))

    # Print each line with offset of longest string
    while IFS= read -r line
    do
        __print_fixed_singleline "$line" $strlen
    done <<< "$1"

    strlen=0
}


__print_fixed_singleline ()
{
    local c_string="$1"
    local mid=$(((strlen+$COLUMNS)/2))
    local leftspace=$((${mid}-strlen))
    
    printf "%-*s%s\n" $leftspace " " "$c_string"
}
