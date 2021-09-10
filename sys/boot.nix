#################################
# BOOT
#################################

{ config, pkgs, ... }:

let
  polyDarkTheme = pkgs.fetchgit {
    url = "https://github.com/shvchk/poly-dark.git";
    rev = "ea17ade04e49fd0ddfc04474b00cdbbdd81c6a3e";
    sha256 = "sha256-7hvrlyi31yNFvtJaaGCL0MZmod+TmRjIPsNqtyVddZg=";
  };
in
{

boot.loader = {
  efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot/efi"; # ← use the same mount point here.
  };
  grub = {
    enable = true;
    device = "nodev";
    version = 2;
    efiSupport = true;
    useOSProber = true;
    enableCryptodisk = true;
    splashImage = "${polyDarkTheme}/background.png";
    extraConfig = ''
      set theme=($drive1)//themes/poly-dark/theme.txt
    '';
  };

  system.activationScripts.copyGrubTheme = ''
    mkdir -p /boot/themes
    cp -R ${polyDarkTheme}/ /boot/themes/poly-dark
  '';
  boot.cleanTmpDir = true;

  boot.plymouth = {
    enable = true;
    themePackages = [ pkgs.adi1090x-plymouth ];
    theme = "lone";
  };
}
