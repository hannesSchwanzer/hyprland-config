# Set first-run mode marker so we can install stuff post-installation
mkdir -p ~/.local/state/hyprland-config
touch ~/.local/state/hyprland-config/first-run.mode

# Setup sudo-less access for first-run
sudo tee /etc/sudoers.d/first-run >/dev/null <<EOF
Cmnd_Alias FIRST_RUN_CLEANUP = /bin/rm -f /etc/sudoers.d/first-run
$USER ALL=(ALL) NOPASSWD: /usr/bin/ufw
$USER ALL=(ALL) NOPASSWD: /usr/bin/gtk-update-icon-cache
$USER ALL=(ALL) NOPASSWD: FIRST_RUN_CLEANUP
EOF
sudo chmod 440 /etc/sudoers.d/first-run
