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
    "pazi"
  ];
  output = {
    programs.pazi = {
      enable = true;
      enableFishIntegration = config.${namespace}.cli.fish.enable or false;
    };
  };
}
