{ pkgs, config, system, inputs, ... }:

{

home.packages = [
  inputs.zen-browser.packages."${system}".default
] ++ (with pkgs; [
  firefox-wayland
  google-chrome
  flameshot
  ffmpeg
  mpv
  yt-dlp
  spotify
]);


  # GTK Configuration (Uncomment to enable)
  /* gtk = {
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
  }; */
}
