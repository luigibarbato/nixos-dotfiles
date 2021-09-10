{ pkgs, ... }:
let
  nodejs = pkgs.nodejs-14_x;
  yarn = pkgs.yarn;
  clang = pkgs.clang_10;
in
{
  home.packages = with pkgs; [
    nodejs
    yarn
    clang
    meson
    cmake
    rustup
    go
    python39
    adoptopenjdk-bin
  ];
}
