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
    "eza"
  ];
  default = true;
  output = {
    programs.eza = {
      enable = true;
      enableFishIntegration = config.${namespace}.cli.fish.enable or false;
      icons = "auto";
      extraOptions = [
        "--group"
        "--smart-group"
      ];
    };
  };
}
