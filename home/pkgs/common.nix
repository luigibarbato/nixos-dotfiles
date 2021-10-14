{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ### PWD
    bitwarden
    gnupg
    pinentry-gnome
  ];

}

