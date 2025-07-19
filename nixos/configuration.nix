{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "redmibook";
  time.timeZone = "Europe/Rome";

  users.users.luigibarbato = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" ];
    shell = pkgs.zsh;
  };

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  programs.zsh.enable = true;
  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [
    git curl wget neofetch htop
    zsh unzip zip
    gnome.gnome-tweaks
    gnomeExtensions.appindicator
  ];

  security.polkit.enable = true;

  # Hyperland
/*   programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
 */
 
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  services.dbus.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  hardware.bluetooth.enable = true;

  system.stateVersion = "24.05";
}
