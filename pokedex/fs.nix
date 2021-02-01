{ ... }:

{
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/nix-sys";
      fsType = "btrfs";
      options = [ "compress=zstd" "subvol=@root" ];
    };

    "/home" = {
      device = "/dev/disk/by-label/nix-sys";
      fsType = "btrfs";
      options = [ "compress=zstd" "subvol=@home" ];
    };

    "/swap" = {
      device = "/dev/disk/by-label/nix-sys";
      fsType = "btrfs";
      options = [ "compress=zstd" "subvol=@swap" ];
    };

    "/.snapshots" = {
      device = "/dev/disk/by-label/nix-sys";
      fsType = "btrfs";
      options = [ "compress=zstd" "subvol=@snapshots" ];
    };

    "/boot/efi" = {
      device = "/dev/disk/by-label/nix-esp";
      fsType = "vfat";
    };

  };

  swapDevices = [{ device = "/swap/swapfile"; }];
}
