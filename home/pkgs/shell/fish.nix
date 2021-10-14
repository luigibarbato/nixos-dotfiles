{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      ps = "procs";
      rg = "ripgrep";
      df = "duf";
      ls = "exa";
      conf = "code $HOME/nixOs-dotfiles/";
    };
    # sessionVariables = {
    #   EDITOR = "micro";
    #   TERM = "xterm-256color";
    #   DOCKER_BUILDKIT = 1;
    # };

    promptInit = "eval (starship init fish)";
    interactiveShellInit = ''
    fish_add_path $HOME/go/bin
    fish_add_path $HOME/scripts
    set -gx EDITOR micro
    set -gx DOCKER_BUILDKIT 1
    '';

    plugins = [
      {
        name = "foreign-env";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-foreign-env";
          rev = "dddd9213272a0ab848d474d0cbde12ad034e65bc";
          sha256 = "06whihwk7cpyi3bxvvh3qqbd5560rknm88psrajvj7308slf0jfd";
        };
      }
    ];
  };
}
