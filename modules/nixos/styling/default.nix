{
  config,
  lib,
  namespace,
  pkgs,
  ...
}:
lib.${namespace}.mkModule {
  inherit config;
  path = ["styling"];
  default = true;
  output = {
    stylix = {
      enable = true;
      autoEnable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

      cursor = {
        name = "catppuccin-mocha-dark-cursors";
        package = pkgs.catppuccin-cursors.mochaDark;
        size = 24;
      };

      fonts = {
        monospace = {
          name = "JetBrainsMono Nerd Font";
          package = pkgs.nerd-fonts.jetbrains-mono;
        };

        sansSerif = {
          name = "Adwaita Sans";
          package = pkgs.adwaita-fonts;
        };

        serif = {
          name = "Noto Serif";
          package = pkgs.noto-fonts;
        };

        emoji = {
          name = "Noto Color Emoji";
          package = pkgs.noto-fonts-emoji-blob-bin;
        };
      };
    };
  };
}
