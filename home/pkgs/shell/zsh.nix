{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;

    shellAliases = {
      ps = "procs";
      rg = "ripgrep";
      df = "duf";
      ls = "exa";
      conf = "code $HOME/nixOs-dotfiles/";
    };

    sessionVariables = {
      EDITOR = "micro";
      TERM = "xterm-256color";
      DOCKER_BUILDKIT = 1;
    };

    completionInit = ''path+=('home/luigi/bins')'';
    oh-my-zsh.enable = true;
    oh-my-zsh.theme = "robbyrussell";
    oh-my-zsh.plugins = ["asdf"];
  };
}
