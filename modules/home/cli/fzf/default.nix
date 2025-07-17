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
    "fzf"
  ];
  output = {
    programs.fzf = {
      enable = true;
      enableFishIntegration = config.${namespace}.cli.fish.enable or false;
    };
  };
}
