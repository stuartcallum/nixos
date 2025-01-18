{ config, pkgs, lib, ... }:
{

	services.gnome.gnome-keyring.enable = true;
	
	services.xserver = {
		enable = true;
		desktopManager.gnome.enable = true;
		displayManager.gdm.enable = true;
	};

#	services.displayManager.autoLogin = {
#		enable = true;
#		user = "callum";
#	};


	## Exclude shitty gnome apps	
	services.gnome.core-utilities.enable = false;	
	environment.gnome.excludePackages = (with pkgs; [
		gnome-photos
		gnome-tour
		gedit
		gnome-disk-utility
	]) ++ (with pkgs; [
		cheese
		gnome-music
		gnome-terminal
		epiphany
		geary
		evince
		gnome-characters
		totem
		tali
		iagno
		hitori
		atomix	
		gnome-weather
	]);

	## gnome packages to include	
	environment.systemPackages = with pkgs; [
		gnome-usage
		gnomeExtensions.dash-to-dock
		alsa-ucm-conf
		wezterm
	];

	services.pipewire.enable = true;

}

