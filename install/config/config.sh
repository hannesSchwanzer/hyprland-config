# Copy over Hyprland specific configs
mkdir -p ~/.config
cp -r "$HYPRLAND_CONFIG_PATH/config/*" ~/.config/

# Load other non-hyperland specific dotfiles
DOTFILES_REPO="hannesSchwanzer/dotfiles"

rm -rf "$HYPRLAND_CONFIG_PATH/dotfiles"

echo -e "\nCloning dotfiles from: https://github.com/${HYPRLAND_CONFIG_REPO}.git"
git clone "https://github.com/${HYPRLAND_CONFIG_REPO}.git" "$HYPRLAND_CONFIG_PATH/dotfiles" >/dev/null

echo -e "\nInstalling dotfiles..."
source "$HYPRLAND_CONFIG_PATH/install.sh"

