{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ### BROWSERS
    firefox
    ## UTILS
    flameshot
    ## MULTIMEDIA
    ffmpeg
    mpv
    youtube-dl
    spotify
    ## CORE-UTILS
    exa
    bat
    fd
  ];

}
