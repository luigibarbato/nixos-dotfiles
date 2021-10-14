{ config, pkgs, ... }:

{
  # Networking
  # networking.wireless.enable = true;
  # networking.networkmanager.enable = true;

  # tmp on tmpfs
  boot.tmpOnTmpfs = true;

  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "altgr-intl";
    xkbOptions = "eurosign:e ctrl:nocaps";
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Time-Zone
  time.timeZone = "Europe/Rome";

  # NTP
  services.chrony.enable = true;

  # So I can use some of my favorite software :)
  nixpkgs.config.allowUnfree = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable thermald
  services.thermald.enable = true;

  # Enable fstrim weekly (SSD Optimization)
  services.fstrim = {
    enable = true;
    interval = "weekly";
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
      gtkUsePortal = true;
    };
  };

  # Enable Intel microcode auto-update (on every boot)
  hardware.cpu.intel.updateMicrocode = true;

  # Enable Docker
  virtualisation.docker.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?

}
