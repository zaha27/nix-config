# Acest fisier va fi inlocuit de output-ul comenzii:
#   nixos-generate-config --root /mnt
# dupa ce partitionezi si montezi disk-ul.
#
# Placeholder pentru disk: inlocuieste DISK_LABEL cu eticheta
# pe care o dai partitiei btrfs (ex: "nixos").
#
# Structura btrfs asteptata:
#   subvol=@      -> /
#   subvol=@home  -> /home
#   subvol=@nix   -> /nix
#   partitie EFI  -> /boot

{ ... }: {
  fileSystems."/" = {
    device = "/dev/disk/by-label/DISK_LABEL";
    fsType = "btrfs";
    options = [ "subvol=@" "compress=zstd" "noatime" ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-label/DISK_LABEL";
    fsType = "btrfs";
    options = [ "subvol=@home" "compress=zstd" "noatime" ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-label/DISK_LABEL";
    fsType = "btrfs";
    options = [ "subvol=@nix" "compress=zstd" "noatime" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/BOOT";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  swapDevices = [];
}
