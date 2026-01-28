{
  env,
  pkgs,
  home-manager,
  nixgl,
  ...
}:

home-manager.lib.homeManagerConfiguration {
  inherit pkgs;

  # Specify your home configuration modules here, for example,
  # the path to your home.nix.
  modules = [ ./home.nix ];

  # Optionally use extraSpecialArgs
  # to pass through arguments to home.nix
  extraSpecialArgs = {
    inherit env nixgl;
  };
}
