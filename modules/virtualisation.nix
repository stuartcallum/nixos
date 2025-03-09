{ config, pkgs, ...}:{

  programs.virt-manager.enable = true;

  virtualisation.libvirtd = {

	      enable = true;

	      qemu = {

	      package = pkgs.qemu_kvm;

	      ovmf.enable = true;

	      ovmf.packages = [ pkgs.OVMFFull.fd ];

	      swtpm.enable = true;

	      runAsRoot = false;

      };

  };

  users.users.callum = {
    isNormalUser = true;
    extraGroups = [ "wheel" "libvirtd" "kvm" ]; # Ensure you're in these groups
  };

  boot = {

      kernelParams = [ "amd_iommu=on" "vfio-pci.ids=1002:747e,1002:ab30" ];

      kernelModules = [ "vfio_pci" "vfio" "vfio_iommu_type1" ];

  };

  environment.systemPackages = with pkgs; [
      pciutils
      virt-manager
      virt-viewer
      spice 
      spice-gtk
      spice-protocol
      win-virtio
      win-spice
      adwaita-icon-theme
      qemu
      quickemu
    ];
}
