{ user, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        inherit (user.git) name email;
      };
      core.editor = user.editor;
    };
  };
}
