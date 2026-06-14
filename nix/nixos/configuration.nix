# Common configuration for NixOS

# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  self,
  stateVersion,
  hostName,
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (builtins) fromTOML readFile;
  env = fromTOML (readFile (self + "/.env"));
  username = env.USER;
in
{
  system.stateVersion = stateVersion;
  networking.hostName = hostName;

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        username
      ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  environment = {
    systemPackages = with pkgs; [
      nix-ld
      openssh
      systemd
      docker
      fish
    ];
  };

  services = {
    openssh = {
      enable = true;
    };
  };

  virtualisation = {
    docker = {
      enable = true;
    };
  };

  programs = {
    nix-ld.enable = true;
    fish.enable = true;
  };

  users.users.${username} = {
    shell = pkgs.fish;
    extraGroups = [ "docker" ];
  };
}
