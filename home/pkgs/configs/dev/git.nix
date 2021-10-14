{
  programs.git = {
    enable = true;
    userName = "Luigi Barbato";
    userEmail = "luigi.barbato@sighup.io";
    signing = {
      key = "0F451D43A5190DF8";
      signByDefault = true;
    };
    ignores = [ "*.iml" ".idea/" ".vscode" ];

    lfs.enable = true;
    delta.enable = true;
  };

}
