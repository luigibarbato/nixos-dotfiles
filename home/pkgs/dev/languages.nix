{ pkgs, ... }:
let
  nodejs = pkgs.nodejs_24;
  yarn = pkgs.yarn;
  python = pkgs.python314;
in
{
  home.packages = with pkgs; [
    gcc
    nodejs
    yarn
    meson
    rustup
    go
    python
  ];
}
