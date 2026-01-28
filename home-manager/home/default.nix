{
  env,
  config,
  lib,
  pkgs,
  ...
}:

{
  # User name and Home directory
  username = env.USER;
  homeDirectory = "/home/${env.USER}";

  # !!MUST NOT BE CHANGED!!
  # Home Manager version
  stateVersion = "24.05"; # Please read the comment before changing.

  # Packages to be installed
  packages = import ./packages.nix { inherit pkgs config; };

  # Files to be linked to certain directories
  file = import ./file.nix { };

  # Environment variables
  sessionVariables = { };
}
