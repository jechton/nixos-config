{
  lib,
  config,
  pkgs,
  namespace,
  ...
}:
lib.${namespace}.mkModule {
  inherit config;
  path = [
    "cli"
    "jj"
  ];
  output = {
    programs.jujutsu = {
      enable = true;
      settings = {
        user = lib.optionalAttrs (config.${namespace}.cli.git.enable) {
          email = config.programs.git.userEmail;
          name = config.programs.git.userName;
        };
      };
    };

    home.packages = with pkgs; [lazyjj];
  };
}
