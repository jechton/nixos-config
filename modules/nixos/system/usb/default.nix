{
  lib,
  config,
  namespace,
  ...
}:
lib.${namespace}.mkModule {
  inherit config;
  path = [
    "system"
    "usb"
  ];
  output = {
    services = {udisks2.enable = true;};
  };
}
