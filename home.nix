{ config, pkgs, ... }:
let
  username = builtins.getEnv "USER";
  homedir = builtins.getEnv "HOME";
in
{
  imports = [

    ## PKGS TO INSTALL...
    ./pkgs/desktop/chat.nix
    ./pkgs/desktop/common.nix
    ./pkgs/dev/languages.nix
    ./pkgs/dev/ops.nix
    ./pkgs/dev/tools.nix
    ## ...AND THEIR CONFIGS
    ./pkgs/configs/dev/git.nix

  ];

  home.username = username;
  home.homeDirectory = homedir;
  home.stateVersion = "21.03";

  programs.home-manager = {
    enable = true;
    path = "https://github.com/nix-community/home-manager/archive/release-21.05.tar.gz";
  };

  manual.manpages.enable = false;
}
