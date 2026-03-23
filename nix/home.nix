{
  env,
  lib,
  config,
  pkgs,
  ...
}@inputs:

{
  # Inherit home configuration
  home = {
    # User name and Home directory
    username = env.USER;
    homeDirectory = "/home/${env.USER}";

    # Home Manager version
    stateVersion = "25.11";

    # Packages to be installed
    packages = import ./packages.nix { inherit pkgs config; };

    # Files to be linked to certain directories
    file = import ./files.nix { inherit config; };

    # Environment variables
    sessionVariables = {
      inherit (env) EDITOR;
    };
  };

  # Nix settings (that will generate ~/.config/nix/nix.conf)
  nix = {
    package = pkgs.nix;
  };

  programs = {
    git = {
      enable = true;
      settings = {
        user = {
          name = env.GIT_USER_NAME;
          email = env.GIT_USER_EMAIL;
        };
        core.editor = env.EDITOR;
      };
    };
    direnv = {
      enable = true;
      enableFishIntegration = true;
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
