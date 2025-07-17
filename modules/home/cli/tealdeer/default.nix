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
  output = {
    programs.tealdeer = {
      enable = true;
      enableAutoUpdates = true;
    };
  };
}
