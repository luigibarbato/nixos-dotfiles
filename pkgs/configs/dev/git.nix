{
  programs.git = {
    enable = true;
    userName = "Luigi Barbato";
    userEmail = "l.barbato11@studenti.unisa.it";
    signing = {
      key = "l.barbato11@studenti.unisa.it";
      signByDefault = true;
    };
    ignores = [ "*.iml" ".idea/" ".vscode" ];

    lfs.enable = true;
  };

}
