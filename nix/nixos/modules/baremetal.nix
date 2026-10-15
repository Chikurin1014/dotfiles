# Configuration for NixOS installed on a physical (non-WSL) machine
#
# See README.md for the hardware configuration and the user password.
{ env, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  # Boot loader (UEFI)
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Tokyo";

  users.users.${env.USER}.extraGroups = [
    "networkmanager"
    "wheel"
  ];
}
