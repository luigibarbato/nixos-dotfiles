{ config, pkgs, ... }: {
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
    ./pkgs/common.nix
    ## ...AND THEIR CONFIGS
    ./pkgs/configs/dev/shell-config.nix
  ];

  home.username = "luigibarbato";
  home.homeDirectory = "/home/luigibarbato";
  programs.home-manager.enable = true;
  home.stateVersion = "25.05";
}
