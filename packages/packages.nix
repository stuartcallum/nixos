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
			alacritty
			spotify
			steam
			discord
			sway
			git
			wget
			nautilus
			rsync
			noto-fonts
			obsidian
			tree
			starship
			blueman
			vim
			polkit
			sway-contrib.grimshot
			p7zip
			gamemode
			pipewire
			wireplumber
			alsa-utils
			coreutils
			pciutils
			samba
			popsicle
      font-awesome
		];
	programs.steam.enable = true;
}
		
