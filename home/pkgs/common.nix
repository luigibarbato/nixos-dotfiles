{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ### PWD
    bitwarden
  ];

}

