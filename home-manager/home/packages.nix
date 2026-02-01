{
  config,
  pkgs,
}:

let
  inherit (pkgs) firge-nerd;
in
with pkgs;
[
  nixd
  nixfmt-rfc-style
  cachix
  # japanese input system
  ibus-engines.mozc
  # fonts
  firge-nerd
  udev-gothic-nf
  # shell
  zsh
  # terminal emulator
  (config.lib.nixGL.wrap ghostty)
  # editor
  neovim
  neovide
  tree-sitter
  # essential tools
  curl
  dbus
  ed
  gcc
  git
  openssh
  systemd
  tmux
  tree
  unzip
  vim
  wget
  # shell tools
  bat
  btop
  dust
  direnv
  difftastic
  eza
  fd
  fzf
  lazygit
  ripgrep
  sd
  sheldon
  starship
  tealdeer
  yazi
  zellij
  # runtime / package manager
  mise
  rustup
  nodePackages.npm
]
