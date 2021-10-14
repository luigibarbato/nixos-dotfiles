{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    ### BROWSERS
    firefox-wayland
    google-chrome
    ## UTILS
    flameshot
    ## MULTIMEDIA
    ffmpeg
    mpv
    youtube-dl
    spotify
    pop-shell
    # mail-notify
  ];

  gtk = {
    enable = true;
    iconTheme = {
      name = "Flat-Remix-Blue-Dark";
      package = pkgs.flat-remix-icon-theme;
    };
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome3.gnome_themes_standard;
    };
    font =
      {
        package = pkgs.cantarell-fonts;
        name = "Cantarell 12";
      };
    gtk3.extraConfig = {
      gtk-cursor-theme-name = "breeze";
      gtk-application-prefer-dark-theme = 1;
    };

  };
}
