{
  lib,
  namespace,
  config,
  ...
}:
lib.${namespace}.mkModule {
  inherit config;
  path = [
    "system"
    "networking"
  ];
  output = {
    networking = {
      networkmanager.enable = true;
    };
  };
}
