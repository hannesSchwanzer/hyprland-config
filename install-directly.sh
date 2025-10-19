#!/bin/bash

sudo pacman -Syu --noconfirm --needed git

HYPRLAND_CONFIG_REPO="hannesSchwanzer/hyprland-config"

echo -e "\nCloning from: https://github.com/${HYPRLAND_CONFIG_REPO}.git"
rm -rf ~/.local/share/hyprland-config/
git clone "https://github.com/${HYPRLAND_CONFIG_REPO}.git" ~/.local/share/hyprland-config >/dev/null

# Use custom branch if instructed, otherwise default to main
HYPRLAND_CONFIG_BRANCH="${HYPRLAND_CONFIG_BRANCH:-main}"
if [[ $HYPRLAND_CONFIG_BRANCH != "main" ]]; then
  echo -e "\e[32mUsing branch: $HYPRLAND_CONFIG_BRANCH\e[0m"
  cd ~/.local/share/hyprland-config
  git fetch origin "${HYPRLAND_CONFIG_BRANCH}" && git checkout "${HYPRLAND_CONFIG_BRANCH}"
  cd -
fi

echo -e "\nInstallation starting..."
source ~/.local/share/hyprland-config/install.sh
