{
  pkgs,
  config,
  system,
  inputs,
  ...
}:

{

  home.packages = [
    inputs.zen-browser.packages."${system}".default
  ]
  ++ (with pkgs; [
    firefox-wayland
    google-chrome
    flameshot
    ffmpeg
    mpv
    yt-dlp
    spotify
  ]);

  # GTK Configuration (Uncomment to enable)
  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela-blue-dark";
    };
    theme = {
      package = pkgs.orchis-theme;
      name = "Orchis-Grey-Dark";
    };
    gtk3.extraConfig = {
      gtk-cursor-theme-name = "breeze";
      gtk-application-prefer-dark-theme = 1;
    };
  };
}
