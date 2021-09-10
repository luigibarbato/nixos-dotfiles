{ config, pkgs, ... }:

{
  # Networking
  networking.networkmanager.enable = true;

  # tmp on tmpfs
  boot.tmpOnTmpfs = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Time-Zone
  time.timeZone = "Europe/Rome";

  # NTP
  services.chrony.enable = true;
  
  # So I can use some of my favorite software :)
  nixpkgs.config.allowUnfree = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable Docker
  virtualisation.docker.enable = true;

  # Configure LightDM Enso theme
  services.xserver.displayManager.lightdm.greeters.enso = {
    enable = true;
    blur = true;
  };

}
