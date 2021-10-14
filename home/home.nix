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
    ./pkgs/shell/starship.nix
    ./pkgs/shell/alacritty.nix
    ./pkgs/shell/zsh.nix
    ./pkgs/shell/fish.nix
    ./pkgs/common.nix
     ## ...AND THEIR CONFIGS
    ./pkgs/configs/dev/git.nix
    ./pkgs/configs/dev/gpg.nix
    ./pkgs/configs/accounts.nix
    ./pkgs/configs/firefox.nix
  ];

        
  home.username = username;
  home.homeDirectory = homedir;
  home.stateVersion = "21.05";

  programs.home-manager = {
    enable = true;
    path = "https://github.com/nix-community/home-manager/archive/release-21.05.tar.gz";
  };


}
