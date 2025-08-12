{
  nixpkgs,
  nixos-wsl,
  vscode-server,
  ...
}:

nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";

  modules = [
    ../configuration.nix
    ./configuration.nix

    nixos-wsl.nixosModules.default
    {
      wsl = import ../wsl-conf/x86_64-linux.nix { };
    }

    vscode-server.nixosModules.default
    (
      { ... }:
      {
        services.vscode-server.enable = true;
      }
    )
  ];
}
