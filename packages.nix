{ pkgs, ... }:
let
	unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in {

		# Allow unfree packages
		nixpkgs.config.allowUnfree = true;

		# List packages installed in system profile. To search, run:
		# $ nix search wget
		environment.systemPackages = with pkgs; [
			unstable.neovim
			firefox
			foot
			alacritty
			spotify
			steam
			pipewire
			alsa-utils
			pavucontrol
			discord
			sway
			git
			wget
			gnome.nautilus
			rsync
			rhythmbox
			noto-fonts
			obsidian
			tree
			starship
      blueman
      vim
      polkit
      sway-contrib.grimshot
      dolphin
		];
	programs.steam.enable = true;
}
		
