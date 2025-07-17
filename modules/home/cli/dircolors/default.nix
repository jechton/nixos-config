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
    "dircolors"
  ];
  output = {
    programs.dircolors = {
      enable = true;
      enableFishIntegration = config.${namespace}.cli.fish.enable or false;
    };
  };
}
