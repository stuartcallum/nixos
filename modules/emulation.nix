
{ pkgs, ... }:
let
	unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in {

	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	# List packages installed in system profile. To search, run:
	# $ nix search wget
	environment.systemPackages = with pkgs; [
		(retroarch.override {
			cores = with libretro; [
				dolphin
				flycast	
				pcsx2
			];
		})
		rpcs3
		xemu
	];
}
