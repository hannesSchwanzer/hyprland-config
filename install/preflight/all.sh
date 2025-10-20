source $INSTALL_SCRIPT_LOCATION/preflight/guard.sh
source $INSTALL_SCRIPT_LOCATION/preflight/begin.sh
run_logged $INSTALL_SCRIPT_LOCATION/preflight/show-env.sh
run_logged $INSTALL_SCRIPT_LOCATION/preflight/pacman.sh
run_logged $INSTALL_SCRIPT_LOCATION/preflight/first-run-mode.sh
run_logged $INSTALL_SCRIPT_LOCATION/preflight/disable-mkinitcpio.sh
