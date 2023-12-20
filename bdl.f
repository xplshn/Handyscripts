#!/bin/ksh

# ANSI color codes
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to display colored output
print_color() {
    local color=$1
    local message=$2
    printf "%b%s%b\n" "$color" "$message" "$NC"
}

# Function that returns a function to install a package using eget
install_package() {
    local package_name=$1

    install() {
        local source_url=$1
        local destination="$HOME/.local/share/bin/$package_name"

        if [ -z "$source_url" ]; then
            print_color "$YELLOW" "Source URL not found for '$package_name'."
            return 1
        fi

        if eget "$source_url" --to "$destination"; then
            chmod +x "$destination"
            print_color "$GREEN" "Package '$package_name' installed."
        else
            print_color "$YELLOW" "Failed to install '$package_name'."
        fi
    }

    echo "$install"
}

# Function that returns a function to retrieve package source URL
find_url() {
    local package_name=$1
    local metadata_url="https://raw.githubusercontent.com/metis-os/hysp-pkgs/main/data/metadata.json"
    local system_arch=$(uname -m)

    retrieve_url() {
        local package_info=$(curl -s "$metadata_url" | jq -r --arg pname "$package_name" --arg sysarch "$system_arch" \
            '.packages[] | select(.name == $pname and .architecture == $sysarch) | .source')
        echo "$package_info"
    }

    echo "$retrieve_url"
}

# Function that returns a function to show detailed package information with color
show_package_info() {
    local package_name=$1
    local metadata_url="https://raw.githubusercontent.com/metis-os/hysp-pkgs/main/data/metadata.json"
    local system_arch=$(uname -m)

    display_info() {
        local package_info=$(curl -s "$metadata_url" | jq --arg pname "$package_name" --arg sysarch "$system_arch" \
            '.packages[] | select(.name == $pname and .architecture == $sysarch) | {description, name, version, updated, size, sha, source}')

        if [ -z "$package_info" ]; then
            print_color "$YELLOW" "Package '$package_name' not found."
        else
            print_color "$GREEN" "$package_info"
        fi
    }

    echo "$display_info"
}

# Function that returns a function to remove an installed package
remove_package() {
    local package_name=$1

    uninstall() {
        local package_location="$HOME/.local/share/bin/$package_name"

        if [ -f "$package_location" ]; then
            rm "$package_location"
            print_color "$GREEN" "Package '$package_name' removed."
        else
            print_color "$YELLOW" "Package '$package_name' is not installed."
        fi
    }

    echo "$uninstall"
}

# Main script
case $1 in
    install)
        package_name=$2
        install_func=$(install_package "$package_name")
        source_url=$(find_url "$package_name")
        $install_func "$source_url"
        ;;
    search)
        show_package_info "$2"
        ;;
    remove)
        package_name=$2
        remove_func=$(remove_package "$package_name")
        $remove_func
        ;;
    *)
        printf "Usage: %s {install|search|remove} <package_name>\n" "$0"
        exit 1
        ;;
esac

exit 0
