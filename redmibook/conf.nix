{ config, pkgs, ... }:

{
    imports =
    [
      # Include common configuration
      ../sys/boot.nix
      ../sys/common.nix
      ../sys/audio/pipewire.nix
      ../sys/user.nix
      ../pkgs/desktop/DE/gnome.nix

    ];

  # Enable touchpad support.
  services.xserver.libinput = {
    enable = true;
    touchpad = {
      naturalScrolling = true;
      additionalOptions = ''MatchIsTouchpad "on"'';
    };
  };

  networking.hostName = "luigi"; 

}
