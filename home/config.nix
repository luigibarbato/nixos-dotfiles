{
allowUnfree = true;
  packageOverrides = pkgs: with pkgs; rec {
        unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) {
      config = {
        allowUnfree = true;
      };
        };
        
    pop-shell = callPackage pkgs/desktop/pop-shell.nix { };
    # mail-notify = callPackage pkgs/desktop/mail-notify.nix { };

  };
}