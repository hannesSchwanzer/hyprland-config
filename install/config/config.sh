shopt -s dotglob

backup_if_exists() {
    local target="$1"
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        local backup="${target}.old"
        echo " Backing up existing file: $target → $backup"
        mv "$target" "$backup"
    fi
}


# Copy over Hyprland specific configs
mkdir -p ~/.config

for item in "$HYPRLAND_CONFIG_PATH/config/"*; do
    target="$HOME/.config/$(basename "$item")"
    backup_if_exists "$target"
    ln -sfn "$item" "$target"
done

# Load other non-hyperland specific dotfiles
DOTFILES_REPO="hannesSchwanzer/dotfiles"

rm -rf "$HYPRLAND_CONFIG_PATH/dotfiles"

echo -e "\nCloning dotfiles from: https://github.com/${DOTFILES_REPO}.git"
git clone "https://github.com/${DOTFILES_REPO}.git" "$HYPRLAND_CONFIG_PATH/dotfiles" >/dev/null

echo -e "\nInstalling dotfiles..."
source "$HYPRLAND_CONFIG_PATH/dotfiles/install.sh"

