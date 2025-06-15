{ configm, lib, pkgs, ... }:
let
  dtfls_files = import ./dtfls/nix/deploy_list.nix { src = ./dtfls; };
  nvim_config_files = import ./nvim-config/nix/deploy_list.nix { src = ./nvim-config; };
in
{
  # User name and Home directory
  home.username = "chikurin";
  home.homeDirectory = "/home/chikurin";

  # !!MUST NOT BE CHANGED!!
  # Home Manager version
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # Nix settings (that will generate ~/.config/nix/nix.conf)
  nix = {
    package = pkgs.nix;
  };

  # Packages to be installed
  home.packages = with pkgs; [
    cachix
    systemd
    # japanese input system
    ibus-engines.mozc
    # shell
    zsh
    # editor
    neovim
    # essential tools
    curl
    dbus
    git
    openssh
    tmux
    tree
    unzip
    vim
    wget
    # shell tools
    bat
    bottom
    broot
    dust
    eza
    fd
    fzf
    lazygit
    navi
    ripgrep
    sd
    sheldon
    starship
    zellij
    # runtime manager
    mise
  ];

  # Files to be linked to certain directories
  home.file = dtfls_files // nvim_config_files;

  # Environment variables
  home.sessionVariables = {};

  programs = {
    zsh = {
      enable = true;
      sessionVariables = {
        EDITOR = "nvim";
      };
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
