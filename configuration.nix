# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
	./hardware-configuration.nix
	./modules/packages.nix
	./modules/hyprland.nix
	./modules/displaymanager.nix
	./modules/games.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-3459e798-ae5b-4b05-a2f5-11f65cf34b0b".device = "/dev/disk/by-uuid/3459e798-ae5b-4b05-a2f5-11f65cf34b0b";
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Australia/Sydney";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_AU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "au";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.callum = {
    isNormalUser = true;
    description = "Callum";
    extraGroups = [ "networkmanager" "wheel" "libvirt" ];
  };

  users.users.work = {
    isNormalUser = true;
    description = "Work";
    extraGroups = [ "networkmanager" "wheel" "libvirt"];
    packages = [ pkgs._1password-gui pkgs.remmina pkgs.adoptopenjdk-icedtea-web];
  };

#  users.allowNoPasswordLogin = true;

  # Enable automatic login for the user.
  # services.getty.autologinUser = "callum";

  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  programs.direnv.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  environment.variables.EDITOR = "nvim";

  xdg.portal = {
    enable = true;
    config = {common = {default = "wlr";};};
    wlr.enable = true;
    wlr.settings.screencast = {
      output_name = "DP-2";
      chooser_type = "simple";
      chooser_cmd = "${pkgs.slurp}/bin/slurp -f %o -or";
    };
  };

	# Remove sound.enable or set it to false if you had it set previously, as sound.enable is only meant for ALSA-based configurations

	# rtkit is optional but recommended
	security.rtkit.enable = true;
	services.pipewire = {
	  enable = true;
	  alsa.enable = true;
	  alsa.support32Bit = true;
	  pulse.enable = true;
	};
	
	security.sudo.wheelNeedsPassword = false;
	
###  options.vfio.enable = with lib;
###    mkEnableOption "Configure the machine fro VFIO";
###  vfio.enable = true;
###  boot.kernelParams = [
###    amd_iommu=on
###    iommu-pt
###    vfio-pci.ids="1002:747e,1002:ab30"
###  ];

 # boot.extraModprobeConfig = ''
 #   options vfio-pci ids=1002:747e,1002:ab30
 # '';

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
