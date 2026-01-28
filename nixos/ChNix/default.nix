{
  system,
  nixpkgs,
  nixos-wsl,
  vscode-server,
  ...
}:

nixpkgs.lib.nixosSystem {
  inherit system;

  modules = [
    ../configuration.nix
    ./configuration.nix

    vscode-server.nixosModules.default
    (
      { ... }:
      {
        services.vscode-server.enable = true;
      }
    )
  ];
}
