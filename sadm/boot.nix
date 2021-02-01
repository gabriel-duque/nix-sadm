{ ... }:

{
  boot = {
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];

    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };

      grub = {
        enable = true;
        version = 2;
        device = "nodev";
        efiSupport = true;
        enableCryptodisk = true;
      };
    };

    initrd = {
      luks.devices."nix-crypt" = {
        device = "/dev/disk/by-partlabel/nix-crypt";
        preLVM = true;
      };

      availableKernelModules =
        [ "xhci_pci" "ehci_pci" "ahci" "usb_storage" "sd_mod" ];
      kernelModules = [ ];
    };
  };

}
