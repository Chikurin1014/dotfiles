{ configm, lib, pkgs, ... }:

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
  home.file = {
    ".zshrc".source                               = files/zshrc;
    ".clang-format".source                        = files/clang-format;
    ".gitconfig".source                           = files/gitconfig;
    ".config/starship.toml".source                = files/config/starship.toml;
    ".config/git/commit_template".source          = files/config/git/commit_template;
    ".config/mise/config.toml".source             = files/config/mise/config.toml;
    ".config/sheldon/plugins.toml".source         = files/config/sheldon/plugins.toml;
    ".config/wezterm/wezterm.lua".source          = files/config/wezterm/wezterm.lua;
    ".config/wezterm/font.lua".source             = files/config/wezterm/font.lua;
    ".config/wezterm/keybindings/init.lua".source = files/config/wezterm/keybindings/init.lua;
    ".config/wezterm/keybindings/keys.lua".source = files/config/wezterm/keybindings/keys.lua;
    ".config/wezterm/themes/init.lua".source      = files/config/wezterm/themes/init.lua;
    ".config/wezterm/themes/no_image.lua".source  = files/config/wezterm/themes/no_image.lua;
    ".config/wezterm/themes/use_image.lua".source = files/config/wezterm/themes/use_image.lua;
    ".config/zellij/config.kdl".source            = files/config/zellij/config.kdl;
    ".config/zellij/completion.zsh".source        = files/config/zellij/completion.zsh;
    ".config/zsh/alias.zsh".source                = files/config/zsh/alias.zsh;
    ".config/zsh/completion.zsh".source           = files/config/zsh/completion.zsh;
    ".config/zsh/option.zsh".source               = files/config/zsh/option.zsh;
    ".config/zsh/ssh-agent.zsh".source            = files/config/zsh/ssh-agent.zsh;
    ".config/zsh/style.zsh".source                = files/config/zsh/style.zsh;
  } // (import ./nvim-config/nix/deploy_list.nix) {
    src = ./nvim-config;
  };

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
