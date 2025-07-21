{
  description = "NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
    };
  };

outputs = inputs@{ self, nixpkgs, home-manager, flake-utils, nixos-hardware, ... }: let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
in {
  nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
    inherit system;
    modules = [
      { nixpkgs.config.allowUnfree = true; }
      ./nixos/configuration.nix
      nixos-hardware.nixosModules.common-pc-ssd
      nixos-hardware.nixosModules.common-cpu-amd
      nixos-hardware.nixosModules.common-gpu-amd
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.luigibarbato = import ./home/luigibarbato.nix;
        home-manager.extraSpecialArgs = {
          inherit self inputs system;
        };
      }
    ];
  };
};
}