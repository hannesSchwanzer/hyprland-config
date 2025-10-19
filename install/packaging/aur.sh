# Install all AUR packages
mapfile -t aur_packages < <(grep -v '^#' "$INSTALL_SCRIPT_LOCATION/aur.packages" | grep -v '^$')
yay -S --noconfirm --needed "${aur_packages[@]}"
