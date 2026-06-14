{ env, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = env.GIT_USER_NAME;
        email = env.GIT_USER_EMAIL;
      };
      core.editor = env.EDITOR;
    };
  };
}
