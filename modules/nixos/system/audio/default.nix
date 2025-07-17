{
  config,
  pkgs,
  lib,
  namespace,
  ...
}:
lib.${namespace}.mkModule {
  inherit config;
  path = [
    "system"
    "audio"
  ];
  output = {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };
}
