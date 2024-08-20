{ config, pkgs, ... }:

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
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  # Packages to be installed
  home.packages = [
    # japanese input system
    pkgs.ibus-engines.mozc
    # shell
    pkgs.zsh
    # editor
    pkgs.neovim
    # essential tools
    pkgs.curl
    pkgs.git
    pkgs.openssl
    pkgs.openssh
    pkgs.tree
    pkgs.unzip
    pkgs.vim
    pkgs.wget
    # shell tools
    pkgs.bat
    pkgs.eza
    pkgs.fd
    pkgs.lazygit
    pkgs.ripgrep
    pkgs.sd
    pkgs.sheldon
    pkgs.starship
    pkgs.tmux
    pkgs.zellij
    # runtime manager
    pkgs.mise
    # compile/build tools
    pkgs.gcc
    pkgs.cmake
    pkgs.platformio
    pkgs.probe-rs
    # formatter/linter
    pkgs.clang-tools
    pkgs.shellcheck
    pkgs.shfmt
  ];

  # Files to be linked to certain directories
  home.file = {
    ".zshrc".source                               = files/zshrc;
    ".clang-format".source                        = files/clang-format;
    ".config/starship.toml".source                = files/config/starship.toml;
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
  };

  # Environment variables
  home.sessionVariables = {
    # EDITOR = "nvim";
  };

  programs = {
    git = {
      enable = true;
      userName = "Chikurin1014";
      userEmail = "chikurin1014@gmail.com";
      extraConfig = {
        core = {
          editor = "code --wait";
        };
        init = {
          defaultBranch = "main";
        };
      };
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
