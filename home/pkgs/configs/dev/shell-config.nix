{ config, pkgs, ... }:

let
  # Environment variables
  envVars = {
    DEV_DIR = "$HOME/Dev/";
    WORK_DIR = "$HOME/Work/";
    RADICAL_WORKDIR = "$HOME/Work/Radical";
    VOLUMIO_WORKDIR = "$HOME/Work/volumio";
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

  # Functions (optional)
  functions = ''
    mkcd() {
      mkdir -p "$1" && cd "$1"
    }
  '';
in
{
  home.sessionVariables = envVars;

  programs.bash.shellAliases = aliases;
  programs.zsh.shellAliases = aliases;
  programs.fish.shellAliases = aliases;

  programs.bash.initExtra = functions;
  programs.zsh.initExtra = functions;
  programs.fish.interactiveShellInit = functions;
}
