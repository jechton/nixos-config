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
    "skim"
  ];
  default = true;
  output = {
    programs.skim = {
      enable = true;
      enableFishIntegration = config.${namespace}.cli.fish.enable or false;
      defaultCommand = "rg --files --hidden";
      changeDirWidgetOptions = [
        "--preview 'eza --icons --git --color always -T -L 3 {} | head -200'"
        "--exact"
      ];
    };
  };
}
