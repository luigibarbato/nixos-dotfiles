{ config, pkgs, ... }:

let
  # Environment variables
  envVars = {
    DEV_DIR = "$HOME/Dev/";
    WORK_DIR = "$HOME/Work/";
    RADICAL_WORKDIR = "$HOME/Work/Radical";
    VOLUMIO_WORKDIR = "$HOME/Work/volumio";
    DOCKER_BUILDKIT = "1";
    EDITOR = "nvim";
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
  };

  # Shell aliases
  aliases = {
    # Overlay
    ls = "lsd";
    cat = "bat";

    # General
    ".." = "cd ..";
    "..." = "cd ../..";
    l = "ls -l";
    la = "ls -a";
    lla = "ls -la";
    lt = "ls --tree";
    ccopy = "pbcopy";
    cpaste = "pbpaste";

    # Git
    gb = "git branches";
    gp = "git push";
    gpr = "git pull --rebase";
    gpf = "git push --force-with-lease";
    ga = "git add";
    gs = "git status";
    g = "git";
    gc = "git checkout";
    gcb = "git checkout -b";
    grs = "g reset --soft HEAD^1";
    grh = "g reset --hard HEAD^1";

    # Work
    w = "cd $WORK_DIR";
    wr = "cd $RADICAL_WORKDIR";
    wv = "cd $VOLUMIO_WORKDIR";

    # Dev
    dev = "cd $DEV_DIR";
    unc = "cd $DEV_DIR/Projects/unconditional";
    k = "kubectl";
  };

  # Functions (bash/zsh compatible)
  functions = ''
    shell="$(basename "$SHELL")"

    _common_improvements() {
      _common_improve_history "$shell"
      _common_keys_binding
    }

    _common_improve_history() {
      history_path="$HOME/.zsh_history"
      shell=$1

      if [ "$shell" = "bash" ]; then
        history_path="$HOME/.bash_history"
      fi

      export HISTFILE=$history_path
      export HISTSIZE=100000
      export SAVEHIST=100000

      # Zsh-specific options (no-op in Bash)
      setopt extended_history 2>/dev/null || true
      setopt hist_expire_dups_first 2>/dev/null || true
      setopt hist_ignore_dups 2>/dev/null || true
      setopt hist_ignore_space 2>/dev/null || true
      setopt hist_verify 2>/dev/null || true
      setopt inc_append_history 2>/dev/null || true
      setopt share_history 2>/dev/null || true
    }

    _common_keys_binding() {
      bindkey "^[[1;5C" forward-word 2>/dev/null || true
      bindkey "^[[1;5D" backward-word 2>/dev/null || true
      bindkey '^[[A' history-substring-search-up 2>/dev/null || true
      bindkey '^[[B' history-substring-search-down 2>/dev/null || true
    }

    _tools_use_starship() {
      if command -v starship > /dev/null; then
        eval "$(starship init "$shell")"
      fi
    }

  '';
in {
  home.sessionVariables = envVars;

  programs.bash.shellAliases = aliases;
  programs.zsh.shellAliases = aliases;
  programs.fish.shellAliases = aliases;

  programs.bash.initExtra = functions;
  programs.zsh.initExtra = functions;
  programs.fish.interactiveShellInit = functions;
}
