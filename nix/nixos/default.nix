{
  env,
  hostName ? "nixos",
  system,
  vscode-server,
  ...
}:

{
  inherit system;

  modules = [
    ../configuration.nix

    vscode-server.nixosModules.default
    (
      { ... }:
      {
        services.vscode-server.enable = true;
      }
    )
  ];

  specialArgs = {
    inherit env hostName;
  };
}
