# Install all base packages
mapfile -t packages < <(grep -v '^#' "$INSTALL_SCRIPT_LOCATION/base.packages" | grep -v '^$')
sudo pacman -S --noconfirm --needed "${packages[@]}"
