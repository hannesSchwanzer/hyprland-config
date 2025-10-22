#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

# Define locations
export HYPRLAND_CONFIG_PATH="$HOME/.local/share/hyprland-config"
export INSTALL_SCRIPT_LOCATION="$HYPRLAND_CONFIG_PATH/install"
export INSTALL_LOG_FILE="/var/log/hyprland-config-install.log"
export PATH="$HYPRLAND_CONFIG_PATH/bin:$PATH"

# Install
source "$INSTALL_SCRIPT_LOCATION/helpers/all.sh"
source "$INSTALL_SCRIPT_LOCATION/preflight/all.sh"
source "$INSTALL_SCRIPT_LOCATION/packaging/all.sh"
source "$INSTALL_SCRIPT_LOCATION/config/all.sh"
source "$INSTALL_SCRIPT_LOCATION/post-install/all.sh"

