{
  config,
}:

{
  ".zshrc".source = ../files/zshrc;
  ".clang-format".source = ../files/clang-format;
  ".gitconfig".source = ../files/gitconfig;
  "${config.xdg.configHome}" = {
    source = ../files/config;
    recursive = true;
  };
}
