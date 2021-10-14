#################################
# BOOT
#################################

{ config, pkgs, ... }:

{
boot = {
  kernelPackages = pkgs.linuxPackages_zen;
	kernelParams = ["mem_sleep_default=deep"];
	loader = {
		# systemd-boot.enable = true;
		 efi = {
  	canTouchEfiVariables = true;	
	};
	  grub = {
    enable = true;
    device = "nodev";
    version = 2;
    efiSupport = true;
    gfxmodeEfi = "1024x768"; # Grub menu is painted really slowly on HiDPI 
    useOSProber = true;
    configurationLimit = 4;
    };
    };
 };


}
