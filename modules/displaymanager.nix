{ pkgs, ... }:
let
	unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in {
	services.displayManager.ly= {
		enable = true;
	};
}
	
