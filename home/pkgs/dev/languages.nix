{ pkgs, ... }:
let
  nodejs = pkgs.nodejs-14_x;
  yarn = pkgs.yarn;
in
{
  home.packages = with pkgs; [
    gcc
    nodejs
    yarn
    meson
    rustup
    go
    python39
    adoptopenjdk-bin
  ];
}
