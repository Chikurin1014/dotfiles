{
  env,
  nixpkgs,
  vscode-server,
  ...
}@inputs:
let
  inherit (nixpkgs) lib;
  extraArgs.commonModules = [
    ./configuration.nix

    vscode-server.nixosModules.default
    (
      { ... }:
      {
        services.vscode-server.enable = true;
      }
    )
  ];
in
{
  ChNix-WSL = import ./ChNix-WSL (extraArgs // inputs);
  ChNix = import ./ChNix (extraArgs // inputs);
}
