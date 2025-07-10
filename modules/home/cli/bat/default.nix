{
  config,
  lib,
  namespace,
  ...
}:
lib.${namespace}.mkModule {
  inherit config;
  path = [
    "cli"
    "bat"
  ];
  default = true;
  output = {
    programs.bat = {
      enable = true;
      config = {
        pager = "less -FR";
        style = "plain";
      };
    };

    home.sessionVariables = {
      MANPAGER = "sh -c 'col -bx | bat -l man -p'";
      MANROFFOPT = "-c";
    };
  };
}
