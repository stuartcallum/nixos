{ config, pkgs, lib, ... }:
{
	environment.systemPackages = with pkgs; [
		grim # screenshot functionality
		slurp # screenshot functionality
		wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
		mako # notification system developed by swaywm maintainer
		waybar
		fuzzel
		xdg-desktop-portal-hyprland
		kitty
		hyprpaper
		mpd
	];

	# Enable the gnome-keyring secrets vault. 
	# Will be exposed through DBus to programs willing to store secrets.
	services.gnome.gnome-keyring.enable = true;
	

	# enable sway window manager
	programs.hyprland= {
		enable = true;
		xwayland.enable = true;
	};
}

