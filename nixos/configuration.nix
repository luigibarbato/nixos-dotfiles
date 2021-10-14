{ sys, config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    # Include common configuration
    ./sys/boot.nix
    ./sys/common.nix
    ./sys/audio/pipewire.nix
    ./sys/user.nix
    ./sys/desktop/DE/gnome.nix
    ./sys/desktop/sway/bundle.nix

  ];

  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel         # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  # Enable touchpad support.
  services.xserver.libinput = {
    enable = true;
    touchpad = {
      naturalScrolling = true;
      additionalOptions = ''MatchIsTouchpad "on"'';
      tapping = true;
    };
  };

  environment.systemPackages = [ pkgs.libsoup pkgs.libgnome-keyring pkgs.libnotify pkgs.libaccounts-glib pkgs.gnome-online-accounts pkgs.gnupg pkgs.pinentry-gnome pkgs.glib];

  networking.hostName = "redmibook";

}
