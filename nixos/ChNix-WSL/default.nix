{
  env,
  system,
  nixpkgs,
  nixos-wsl,
  commonModules,
  ...
}:

nixpkgs.lib.nixosSystem {
  inherit system;

  modules = commonModules ++ [
    ./configuration.nix

    nixos-wsl.nixosModules.default
    {
      wsl = import ../wsl-conf/${system}.nix { inherit env; };
    }
  ];

  specialArgs = {
    inherit env;
  };
}
