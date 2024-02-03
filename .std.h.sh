#!/bin/sh
#### "Standard" POSIX SH library. ####
#############################Provides:

# spinner() require() palette255

# Display a spinner loader with the colors declared(or not!) in the COOLSPINNERCOLOR variable
spinner() {
    if [ -z "$COOLSPINNER" ]; then
        COOLSPINNER='|/-\\'
    fi

    if [ -z "$COOLSPINNER_COLOR" ]; then
        COOLSPINNER_COLOR='\033[0m'
    fi

    if [ -z "$COOLSPINNER_DELAY" ]; then
        COOLSPINNER_DELAY=0.1
    fi

    len=$(printf "%s" "$COOLSPINNER" | wc -c | awk '{print $1}')
    trap 'printf "\033[?25h"; exit' INT

    while true; do
        i=1
        while [ "$i" -le "$len" ]; do
            char=$(printf "%s" "$COOLSPINNER" | cut -c "$i")
            if [ -n "$COOLSPINNER_COLOR" ]; then
                printf "%b%s%b" "$COOLSPINNER_COLOR" "$char" "\033[0m"
            else
                printf "%s" "$char"
            fi
            sleep "$COOLSPINNER_DELAY"
            printf "\r"
            i=$((i + 1))
        done
    done
}

# Check if a dependency is installed.
require() {
    command -v "$1" >/dev/null 2>&1 || { printf "Error: %s is not installed\n" "$1" >&2; exit 1; }
}

# Display a color palette of N colors with(out) text.
palette() {
    [ -z "$COOLPALETTE" ] && COOLPALETTE=16
    p_display() {
        for c in $(seq 0 "$((COOLPALETTE - 1))"); do
            [ "$COOLPALETTE_TEXT" = "0" ] && printf '\033[48;5;%dm ' "$c" || printf '\033[48;5;%dm%3d' "$c" "$c"
        done
        printf '\033[0m\n'
    }
    p_display
}

unnappear() {
    "$@" >/dev/null 2>&1
}
s() {
    export "$1"="$2"
}

set_colors() {
    color00="#272822"  # Base 00 - Black
    color01="#f92672"  # Base 08 - Red
    color02="#a6e22e"  # Base 0B - Green
    color03="#f4bf75"  # Base 0A - Yellow
    color04="#66d9ef"  # Base 0D - Blue
    color05="#ae81ff"  # Base 0E - Magenta
    color06="#a1efe4"  # Base 0C - Cyan
    color07="#f8f8f2"  # Base 05 - White
    color08="#75715e"  # Base 03 - Bright Black
    color09="#f92672"  # Base 08 - Bright Red
    color10="#a6e22e"  # Base 0B - Bright Green
    color11="#f4bf75"  # Base 0A - Bright Yellow
    color12="#66d9ef"  # Base 0D - Bright Blue
    color13="#ae81ff"  # Base 0E - Bright Magenta
    color14="#a1efe4"  # Base 0C - Bright Cyan
    color15="#f9f8f5"  # Base 07 - Bright White
    color16="#fd971f"  # Base 09
    color17="#cc6633"  # Base 0F
    color18="#383830"  # Base 01
    color19="#49483e"  # Base 02
    color20="#a59f85"  # Base 04
    color21="#f5f4f1"  # Base 06
    color_foreground="#f8f8f2"   # Base 05
    color_background="#272822"   # Base 00

    # Variables to set
    s GUM_FILE_CURSOR_FOREGROUND "$color00"
    s GUM_FILE_SYMLINK_FOREGROUND "$color19"
    s GUM_FILE_DIRECTORY_FOREGROUND "$color02"
    s GUM_FILE_FILE_FOREGROUND "$color_foreground"
    s GUM_FILE_PERMISSIONS_FOREGROUND "$color20"
    s GUM_FILE_SELECTED_FOREGROUND "$color00"
    s GUM_FILE_FILE_SIZE_FOREGROUND "$color21"
#    s GUM_CONFIRM_PROMPT_FOREGROUND "$color_foreground"
#    s GUM_CONFIRM_SELECTED_FOREGROUND "$color09"  # Set to a color similar to Base 09
#    s GUM_CONFIRM_UNSELECTED_FOREGROUND "$color07"  # Set to a color similar to Base 07
    s GUM_FILTER_INDICATOR_FOREGROUND "$color00"
    s GUM_FILTER_SELECTED_PREFIX_FOREGROUND "$color00"
    s GUM_FILTER_UNSELECTED_PREFIX_FOREGROUND "$color21"
    s GUM_FILTER_HEADER_FOREGROUND "$color21"
    s GUM_FILTER_TEXT_FOREGROUND "$color_foreground"
    s GUM_FILTER_CURSOR_TEXT_FOREGROUND "$color_foreground"
    s GUM_FILTER_MATCH_FOREGROUND "$color00"
    s GUM_FILTER_PROMPT_FOREGROUND "$color21"
    s GUM_FILTER_PLACEHOLDER_FOREGROUND "$color21"
    s GUM_INPUT_PROMPT_FOREGROUND "$color_foreground"
    s GUM_INPUT_PLACEHOLDER_FOREGROUND "$color02"  # Set to a color similar to Base 0B
    s GUM_INPUT_CURSOR_FOREGROUND "$color07"
    s GUM_INPUT_HEADER_FOREGROUND "$color21"
    s GUM_WRITE_BASE_FOREGROUND ""
    s GUM_WRITE_CURSOR_LINE_NUMBER_FOREGROUND "$color05"
    s GUM_WRITE_CURSOR_LINE_FOREGROUND "$color_foreground"
    s GUM_WRITE_CURSOR_FOREGROUND "$color07"  # Set to a color similar to Base 0E
    s GUM_WRITE_END_OF_BUFFER_FOREGROUND "$color00"
    s GUM_WRITE_LINE_NUMBER_FOREGROUND "$color07"  # Set to a color similar to Base 05
    s GUM_WRITE_HEADER_FOREGROUND "$color21"
    s GUM_WRITE_PLACEHOLDER_FOREGROUND "$color21"
    s GUM_WRITE_PROMPT_FOREGROUND "$color07"  # Set to a color similar to Base 05
    s GUM_CHOOSE_CURSOR_FOREGROUND "$color05"  # Set to a color similar to Base 0E
    s GUM_CHOOSE_HEADER_FOREGROUND "$color21"
    s GUM_CHOOSE_ITEM_FOREGROUND "$color_foreground"
    s GUM_CHOOSE_SELECTED_FOREGROUND "$color05"  # Set to a color similar to Base 0E
}
