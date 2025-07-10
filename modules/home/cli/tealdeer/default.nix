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
    "tealdeer"
  ];
  default = true;
  output = {
    programs.tealdeer = {
      enable = true;
      enableAutoUpdates = true;
    };
  };
}
