{ lib, ... }:
{
  programs.starship.enable = true;
  programs.starship.enableBashIntegration = true;
  programs.starship.enableFishIntegration = true;
  programs.starship.settings = {
    add_newline = false;
    format = lib.concatStrings [
      "$line_break"
      "$package"
      "$line_break"
      "$directory"
      "$git_branch"
      "$node"
      "$rust"
      "(bold green)"
    ];
    scan_timeout = 10;
    directory.format = "[$path]($style) ";
    time.disabled = true;
  };
}
