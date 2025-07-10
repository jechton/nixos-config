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
  default = true;
  output = {
    programs.dircolors = {
      enable = true;
      enableFishIntegration = config.${namespace}.cli.fish.enable or false;
    };
  };
}
