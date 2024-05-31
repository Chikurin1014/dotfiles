{ config, pkgs, ... }:

{
  # User name and Home directory
  home.username = "chikurin";
  home.homeDirectory = "/home/chikurin";

  # !!MUST NOT BE CHANGED!!
  # Home Manager version
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # Packages to be installed
  home.packages = [
    # shell
    pkgs.zsh
    # essential tools
    pkgs.curl
    pkgs.git
    pkgs.openssl
    pkgs.openssh
    pkgs.tree
    pkgs.vim
    pkgs.wget
    # shell tools
    pkgs.sheldon
    pkgs.starship
    pkgs.tmux
    pkgs.tee
    pkg.bat
    pkgs.eza
    # gnu compiler collection
    pkgs.libgcc
    # runtime manager
    pkgs.mise
  ];

  # Files to be linked to certain directories
  home.file = {
    ".zshrc".source                               = files/zshrc;
    ".tmux.conf".source                           = files/tmux.conf;
    ".config/starship.toml".source                = files/config/starship.toml;
    ".config/mise/config.toml".source             = files/config/mise/config.toml;
    ".config/sheldon/plugins.toml".source         = files/config/sheldon/plugins.toml;
    ".config/wezterm/wezterm.lua".source          = files/config/wezterm/wezterm.lua;
    ".config/wezterm/font.lua".source             = files/config/wezterm/font.lua;
    ".config/wezterm/keybindings/init.la".source  = files/config/wezterm/keybindings/init.lua;
    ".config/wezterm/keybindings/keys.la".source  = files/config/wezterm/keybindings/keys.lua;
    ".config/wezterm/themes/init.lua".source      = files/config/wezterm/themes/init.lua;
    ".config/wezterm/themes/no_image.lua".source  = files/config/wezterm/themes/no_image.lua;
    ".config/wezterm/themes/use_image.lua".source = files/config/wezterm/themes/use_image.lua;
    # install tmux plugin manager
    # ref: https://github.com/tmux-plugins/tpm
    ".tmux/plugins/tpm".source = pkgs.fetchFromGitHub {
      owner = "tmux-plugins";
      repo = "tpm";
    };
  };

  # Environment variables
  home.sessionVariables = {
    # EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
