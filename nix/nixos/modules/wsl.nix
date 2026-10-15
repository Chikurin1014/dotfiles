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
    # Use ssh-agent service of Windows via wsl2-ssh-agent
    # (this also sets SSH_AUTH_SOCK)
    ssh-agent.enable = true;
  };
}
