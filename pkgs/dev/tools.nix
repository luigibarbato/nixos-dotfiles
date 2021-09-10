{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ### EDITORS
    vscode
    sublime4
    jetbrains.idea-ultimate
    micro
    ### UTILS
    k9s
    lazygit
    lazydocker
    gitkraken 
  ];

}
