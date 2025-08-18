{
  config,
  pkgs,
}:

let
  inherit (pkgs) firge-nerd;
in
with pkgs;
[
  nixfmt-rfc-style
  cachix
  # japanese input system
  ibus-engines.mozc
  # fonts
  firge-nerd
  # shell
  zsh
  # terminal emulator
  (config.lib.nixGL.wrap ghostty)
  # editor
  neovim
  # essential tools
  curl
  dbus
  ed
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
  broot
  dust
  direnv
  difftastic
  eza
  fd
  fzf
  lazygit
  navi
  ripgrep
  sd
  sheldon
  starship
  tealdeer
  zellij
  # runtime / package manager
  mise
  nodePackages.npm
]
