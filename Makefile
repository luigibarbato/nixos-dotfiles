# Variables
HOST ?= nixos
USER ?= luigibarbato

# System operations
switch:
	sudo nixos-rebuild switch --flake .#$(HOST)

boot:
	sudo nixos-rebuild boot --flake .#$(HOST)

test:
	sudo nixos-rebuild test --flake .#$(HOST)

build:
	sudo nixos-rebuild build --flake .#$(HOST)

# Home Manager operations
home-switch:
	home-manager switch --flake .#$(USER)

home-build:
	home-manager build --flake .#$(USER)

# Flake update
update:
	nix flake update

# Garbage collection
gc:
	sudo nix-collect-garbage -d
	nix-collect-garbage -d

# Show system generations
generations:
	sudo nix-env --list-generations --profile /nix/var/nix/profiles/system

# Show home-manager generations
home-generations:
	home-manager generations

# Clean up old generations
clean:
	sudo nix-collect-garbage --delete-older-than 7d
	nix-collect-garbage --delete-older-than 7d

.PHONY: switch boot test build home-switch home-build update gc generations home-generations clean 
