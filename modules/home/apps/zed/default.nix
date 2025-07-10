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
    "zed"
  ];
  output = {
    programs.zed-editor = {
      enable = true;
      extensions = ["nix"];
      userSettings = {telemetry = {metrics = false;};};
    };
  };
}
