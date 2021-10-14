{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ## EDITORS ##
    vscode
    jetbrains.idea-ultimate
    micro
    ## UTILS ## 
    k9s
    lazygit
    lazydocker
    gitkraken
    nixpkgs-fmt
    ## CORE ##
    gnumake
    cmake
    mmake
    exa
    bat
    bats
    fd
    delta
    dog
    duf
    ripgrep
    procs
    ];

}
