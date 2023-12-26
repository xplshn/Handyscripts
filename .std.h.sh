#### "Standard" POSIX SH library. ####
##############################Provides:

# spinner() require() palette255

# Display a spinner loader with the colors declared(or not!) in the COOLSPINNERCOLOR variable
spinner() {
    [ -z "$COOLSPINNER" ] && COOLSPINNER='|/~\\'
    [ -z "$COOLSPINNER_COLOR" ] && COOLSPINNERCOLOR='\033[0m'
    [ -z "$COOLSPINNER_DELAY"] && COOLSPINNER_DELAY=0.1
    len=${#COOLSPINNER}
    trap 'printf "\033[?25h"; exit' INT
    while true; do
        i=0
        while [ "$i" -lt "$len" ]; do
            char=$(printf "%s" "$COOLSPINNER" | cut -c "$((i + 1))")
            [ -n "$COOLSPINNERCOLOR" ] && printf "%b%s%b" "$COOLSPINNERCOLOR" "$char" "\033[0m" || printf "%s" "$char"
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
