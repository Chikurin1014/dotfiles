{
  nixpkgs,
  nixos-wsl,
  vscode-server,
}:

{
  ChNix-WSL = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";

    modules = [
      ./configuration.nix

      ./ChNix-WSL.nix

      nixos-wsl.nixosModules.default
      {
        wsl = import ./wsl-conf/x86_64-linux.nix { };
      }

      vscode-server.nixosModules.default
      (
        { ... }:
        {
          services.vscode-server.enable = true;
        }
      )
    ];
  };
}
