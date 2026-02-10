{
  env,
  lib,
  config,
  pkgs,
  nixgl ? import <nixgl> { inherit pkgs; },
  ...
}@inputs:

{
  # Inherit home configuration
  home = {
    # User name and Home directory
    username = env.USER;
    homeDirectory = "/home/${env.USER}";

    # !!MUST NOT BE CHANGED!!
    # Home Manager version
    stateVersion = "24.05"; # Please read the comment before changing.

    # Packages to be installed
    packages = import ../packages.nix { inherit pkgs config; };

    # Files to be linked to certain directories
    file = import ../files.nix { inherit config; };

    # Environment variables
    sessionVariables = { };
  };

  # Nix settings (that will generate ~/.config/nix/nix.conf)
  nix = {
    package = pkgs.nix;
  };

  programs = {
    zsh = {
      enable = true;
      sessionVariables = {
        inherit (env) EDITOR;
      };
    };
    git = {
      enable = true;
      extraConfig = {
        user = {
          name = env.GIT_USER_NAME;
          email = env.GIT_USER_EMAIL;
        };
        core.editor = env.EDITOR;
      };
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
