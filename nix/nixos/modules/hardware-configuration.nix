# PLACEHOLDER: replace this file with the one generated on the target machine:
#
#   nixos-generate-config --show-hardware-config > nix/nixos/modules/hardware-configuration.nix
#
# The values below assume a UEFI machine whose partitions are labeled
# `nixos` (root, ext4) and `boot` (ESP, vfat), as in the NixOS manual.
{ lib, modulesPath, ... }:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/boot";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
