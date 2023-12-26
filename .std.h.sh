#### "Standard" POSIX SH library. ####
##############################Provides:

# spinner() require() palette255

# Display a spinner loader with the colors declared(or not!) in the COOLSPINNERCOLOR variable
# Display a spinner loader with default colors
spinner() {
    if [ -z "$COOLSPINNER" ]; then
        COOLSPINNER='|/~\\'
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
            printf "\b"
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
