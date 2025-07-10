{
  lib,
  config,
  namespace,
  pkgs,
  ...
}:
lib.${namespace}.mkModule {
  inherit config;
  path = ["shell"];
  default = true;
  output = {
    programs = {
      command-not-found.enable = false;
      fish = {
        enable = true;
        interactiveShellInit = ''
          set fish_greeting

          function fish_command_not_found
            , $argv
          end
        '';
      };
      nix-index-database.comma.enable = true;
      nix-index.enableFishIntegration = false;
    };
    users.defaultUserShell = pkgs.fish;
  };
}
