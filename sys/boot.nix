#################################
# BOOT
#################################

{ config, pkgs, ... }:

{

boot.loader = {
  grub = {
    enable = true;
    device = "/dev/vda";
    version = 2;
    };
};

}
