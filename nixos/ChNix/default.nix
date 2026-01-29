{
  system,
  nixpkgs,
  commonModules,
  ...
}:

nixpkgs.lib.nixosSystem {
  inherit system;

  modules = commonModules ++ [
    ./configuration.nix
  ];

  specialArgs = {
    inherit env;
  }
}
