{ config, pkgs, ... }:

{
## ENABLING GNOME
services.xserver.enable = true;
services.xserver.displayManager.gdm.enable = true;
services.xserver.desktopManager.gnome.enable = true;
## EXCLUDING STUPID GNOME PACKAGES
environment.gnome.excludePackages = [ pkgs.gnome.cheese pkgs.gnome-photos pkgs.gnome.gnome-music pkgs.gnome.gnome-terminal pkgs.gnome.gedit pkgs.epiphany pkgs.evince pkgs.gnome.gnome-characters pkgs.gnome.totem pkgs.gnome.tali pkgs.gnome.iagno pkgs.gnome.hitori pkgs.gnome.atomix pkgs.gnome-tour ];
## ENABLING SOME WONDERFUL GNOME EXTENSION
environment.systemPackages = with pkgs; [ gnomeExtensions.appindicator ];
## ENSURE GNOME-SETTINGS-DAEMON IS OK 
services.udev.packages = with pkgs; [ gnome3.gnome-settings-daemon ];

}