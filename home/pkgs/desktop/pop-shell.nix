{ stdenv, fetchFromGitHub, glib, nodePackages, pkgs }:

stdenv.mkDerivation rec {
  pname = "pop-shell";
  version = "master";

  src = fetchFromGitHub {
   owner = "pop-os";
   repo = "shell";
   rev = "4c693492d6f656d5dca93dbf10a9aa7aea3d6517";
   sha256 = "1hn0mv07p2g73llp7dr5blq09x7fmis02hfr7zprvnm285xxiymk";
  };
  nativeBuildInputs = with pkgs; [ glib nodePackages.typescript ];
  buildInputs = with pkgs; [ gjs ];

  patches = [
    ./customize.patch
  ];
  
  makeFlags = [
    "INSTALLBASE=$(out)/share/gnome-shell/extensions"
    "PLUGIN_BASE=$(out)/lib/pop-shell/launcher"
    "SCRIPTS_BASE=$(out)/lib/pop-shell/scripts"
  ];

  postInstall = ''
    find $out -name main.js -exec chmod +x {} \;
    '';
}
