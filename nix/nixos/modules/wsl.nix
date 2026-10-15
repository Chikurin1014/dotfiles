# Configuration for NixOS on WSL
{ inputs, env, ... }:
{
  imports = [
    inputs.nixos-wsl.nixosModules.default
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  wsl = {
    enable = true;
    defaultUser = env.USER;
  };
}
