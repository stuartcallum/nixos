{ config, pkgs, lib, ... }: {
	environment.systemPackages = with pkgs; [
		samba
	];

	services.samba = {
		enable = true;
		securityType = "user";
		openFirewall = true;
		shares = {
			public = {
				path = "/home/callum/share";	
				"read only" = true;
				browseable = "yes";
				"guest ok" = "yes";
				comment = "Public samba share.";
			};
		};
	};
}
