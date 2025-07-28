{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;

    completionInit = ''path+=('home/luigi/bins')'';
    oh-my-zsh.enable = true;
    oh-my-zsh.theme = "robbyrussell";
    oh-my-zsh.plugins = ["asdf"];
  };
}
