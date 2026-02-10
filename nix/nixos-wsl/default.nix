{
  env,
  hostName ? "nixos-wsl",
  system,
  vscode-server,
  nixos-wsl,
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

    nixos-wsl.nixosModules.default
    {
      wsl = import ./wsl-conf/${system}.nix { inherit env; };
    }
  ];

  specialArgs = {
    inherit env hostName;
  };
}
