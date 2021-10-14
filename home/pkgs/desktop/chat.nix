{ pkgs, ... }:

{
  home.packages = with pkgs; [
    slack
    teams
    discord
    zoom-us
    tdesktop
  ];

}
