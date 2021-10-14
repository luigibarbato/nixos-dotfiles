{ config, pkgs, ... }:

{
  #################################
  # USER CREATION
  #################################
  users.users.luigi = {
    name = "luigi";
    isNormalUser = true;
    home = "/home/luigi";
    extraGroups = [
      "wheel"
      "input"
      "video"
      "bumblebee"
      "docker"
      "autologin"
      "users"
      "networkmanager"
      "libvirtd"
      "steamps4"
      "gnome"
    ];
    shell = pkgs.zsh;
  };
}
