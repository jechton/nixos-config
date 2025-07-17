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
    "atuin"
  ];
  output = {
    programs.atuin = {
      enable = true;
      enableFishIntegration = config.${namespace}.cli.fish.enable or false;
      flags = [
        "--disable-up-arrow"
      ];
      settings = {
        style = "compact";
        show_hekp = false;
        inline_height = 5;
        search_mode = "skim";
      };
    };
  };
}
