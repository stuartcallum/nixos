{ pkgs, ... }:
let
	unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in {
	nixpkgs.config.allowUnfree = true;

	environment.systemPackages = with pkgs; [
		steam
		discord
		gamemode
		mangohud
	];

	programs.steam.enable = true;
}
	
