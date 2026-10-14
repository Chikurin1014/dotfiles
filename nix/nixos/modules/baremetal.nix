# Configuration for NixOS installed on a physical (non-WSL) machine
#
# After installation, set the user's password with `passwd <user>` as root.
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
