{ config, pkgs, ... }:

{
## ENABLING GNOME
services.xserver.displayManager.gdm.enable = true;
services.xserver.desktopManager.gnome.enable = true;
services.gnome.evolution-data-server.enable = true;
services.gnome.gnome-online-accounts.enable = true;

programs.dconf.enable = true;

## EXCLUDING STUPID GNOME PACKAGES
environment.gnome.excludePackages = [ pkgs.gnome.cheese pkgs.gnome-photos pkgs.gnome.gnome-music pkgs.epiphany pkgs.gnome.gnome-characters pkgs.gnome.totem pkgs.gnome.tali pkgs.gnome.iagno pkgs.gnome.hitori pkgs.gnome.atomix pkgs.gnome-tour ];
## ENABLING SOME WONDERFUL GNOME EXTENSION
environment.systemPackages = with pkgs; [gnome.networkmanager-openvpn gnomeExtensions.workspaces-bar gnomeExtensions.audio-switcher-40 gnomeExtensions.workspaces-bar gnome.gnome-tweaks gnomeExtensions.just-perfection gnomeExtensions.tray-icons-reloaded gnomeExtensions.vitals gnomeExtensions.top-panel-workspace-scroll];
## ENSURE GNOME-SETTINGS-DAEMON IS OK 
services.udev.packages = with pkgs; [ gnome3.gnome-settings-daemon ];

}
