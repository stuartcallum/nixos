{ pkgs, ... }:
let
	unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in {

		# Allow unfree packages
		nixpkgs.config.allowUnfree = true;

		# List packages installed in system profile. To search, run:
		# $ nix search wget
		environment.systemPackages = with pkgs; [
			unstable.neovim # text editor
			firefox	# web browser
			git # code manager
			wget # download files
			rsync # sync directories
			obsidian # note taking
			tree
			blueman # manage bluetooth
			vim
			polkit # ask for root password
			sway-contrib.grimshot # screenshots
			p7zip # (un)compress files
			pipewire # audio
			wireplumber # legacy audio compatability
			alsa-utils # manage volume levels
			coreutils # standard unix utilites
			pciutils # manage GPU / CPU temps
			popsicle # flash USBs
			openssl # cert management & key gen
			networkmanager-openvpn # integrate VPN with networkmanager
			pavucontrol # alsa-mixer gui
			fzf # fuzzy finder
			ranger # tui file explorer
			lxappearance	# gtk themes
			pam	# pluggable authentication module
		];

	fonts.packages = with pkgs; [
	  noto-fonts
	  noto-fonts-cjk-sans
	  noto-fonts-emoji
	  liberation_ttf
	  fira-code
	  fira-code-symbols
	  mplus-outline-fonts.githubRelease
	  dina-font
	  proggyfonts
	  font-awesome
	];

	programs.thunar.enable = true; # file explorer

# 	services.openvpn.servers = {
# 		officeVPN = { config = '' config /home/.openvpn3/Documents/visualcortex.ovpn ''; };
# 	};

}
		
