{ config, pkgs, lib, ... }:
{

  services = {
    xserver.displayManager.gdm.enable = true;
    xserver.desktopManager.gnome.enable = true;
    gnome.gnome-keyring.enable = true;
  };

	
# 	services.xserver = {
# 		enable = true;
# 		desktopManager.gnome.enable = true;
# 		displayManager.gdm.enable = false;
# 	};

	services.displayManager.autoLogin = {
		enable = true;
		user = "callum";
	};


	## Exclude shitty gnome apps	
	services.gnome.core-apps.enable = false;	
	environment.gnome.excludePackages = (with pkgs; [
		gnome-photos
		gnome-tour
		gedit
		gnome-music
		# gnome-terminal
		epiphany
		geary
		evince
		# gnome-characters
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
		ghostty
	];

	services.pipewire.enable = true;

}

