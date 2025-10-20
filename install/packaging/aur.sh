# Ensure yay is installed
if ! command -v yay &> /dev/null; then
    echo "yay not found. Installing yay..."
    # Install dependencies for building yay
    sudo pacman -S --needed --noconfirm git base-devel
    # Clone yay repository and build
    temp_dir=$(mktemp -d)
    git clone https://aur.archlinux.org/yay.git "$temp_dir/yay"
    pushd "$temp_dir/yay" || exit
    makepkg -si --noconfirm
    popd || exit
    rm -rf "$temp_dir"
fi


# Install all AUR packages
mapfile -t aur_packages < <(grep -v '^#' "$INSTALL_SCRIPT_LOCATION/aur.packages" | grep -v '^$')
yay -S --noconfirm --needed "${aur_packages[@]}"
