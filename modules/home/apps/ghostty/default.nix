{
  lib,
  config,
  namespace,
  ...
}:
lib.${namespace}.mkModule {
  inherit config;
  path = [
    "apps"
    "ghostty"
  ];
  output = {
    programs.ghostty = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
