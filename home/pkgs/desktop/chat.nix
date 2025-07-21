{ pkgs, ... }:

{
  home.packages = with pkgs; [
    slack
    discord
    tdesktop
  ];

}
