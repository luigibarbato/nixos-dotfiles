{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.loader.grub.device = "/dev/sda";

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
    pkgs.gnome-tweaks
    gnomeExtensions.appindicator
  ];

  programs = {
    gnupg.agent.enable = true;
    gnupg.agent.pinentryPackage = pkgs.pinentry-qt;
    ssh.askPassword = "";
  };

  security.polkit.enable = true;

  # Hyperland
/*   programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
 */

# To avoid “too many open files” error
  security.pam.loginLimits = [
  { domain = "*"; type = "soft"; item = "nofile"; value = "65536"; }
  { domain = "*"; type = "hard"; item = "nofile"; value = "1048576"; }
];


  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  services.dbus.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  hardware.pulseaudio.enable = false;
  hardware.bluetooth.enable = true;

  system.stateVersion = "24.05";
}
