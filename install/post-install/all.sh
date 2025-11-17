run_logged $INSTALL_SCRIPT_LOCATION/post-install/enable-mkinitcpio.sh
run_logged $INSTALL_SCRIPT_LOCATION/post-install/pacman.sh
source $INSTALL_SCRIPT_LOCATION/post-install/finished.sh
