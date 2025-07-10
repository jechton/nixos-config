{
  lib,
  config,
  namespace,
  ...
}:
lib.${namespace}.mkModule {
  inherit config;
  path = [
    "cli"
    "starship"
  ];
  output = {
    programs.starship = {
      enable = true;
    };
  };
}
