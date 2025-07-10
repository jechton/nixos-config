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
    "cli"
    "fish"
  ];
  output = {
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        set -g fish_greeting
      '';
      shellInit = '''';
      plugins = with pkgs.fishPlugins; [
        {
          name = "autopair.fish";
          inherit (autopair-fish) src;
        }
        {
          name = "colored-man-pages";
          inherit (colored-man-pages) src;
        }
        {
          name = "fifc";
          inherit (fifc) src;
        }
        {
          name = "fish-you-should-use";
          inherit (fish-you-should-use) src;
        }
        {
          name = "plugin-git";
          inherit (plugin-git) src;
        }
        {
          name = "plugin-sudope";
          inherit (plugin-sudope) src;
        }
      ];

      functions = {
        gitignore = "curl -sL https://www.gitignore.io/api/$argv";
      };

      shellAbbrs = {
        q = "exit";
        c = "clear";
      };
    };
  };
}
