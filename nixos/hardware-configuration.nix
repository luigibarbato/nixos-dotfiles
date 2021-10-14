# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/04fc5070-6087-4b82-a251-b02d3b998196";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-ae6e2dc9-5682-4b23-8736-4cd2f7433639".device = "/dev/disk/by-uuid/ae6e2dc9-5682-4b23-8736-4cd2f7433639";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/FA2E-D8E2";
      fsType = "vfat";
    };

  swapDevices = [ ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  # high-resolution display
  hardware.video.hidpi.enable = lib.mkDefault true;
}
