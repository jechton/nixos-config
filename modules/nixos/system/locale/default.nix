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
    "locale"
  ];
  output = {
    console.keyMap = "us";
    i18n = {
      defaultLocale = "en_US.UTF-8";

      supportedLocales = ["en_US.UTF-8/UTF-8"];
    };
    time.timeZone = "America/New_York";
    services.xserver.xkb.layout = "us";
  };
}
