{
  lib,
  namespace,
  config,
  ...
}:
lib.${namespace}.mkModule {
  inherit config;
  path = [
    "cli"
    "git"
  ];
  extraOptions = with lib.types; {
    email = lib.${namespace}.mkOpt' str "44993244+jechton@users.noreply.github.com";
    username = lib.${namespace}.mkOpt' str "Jeremiah";
  };
  output = with config.${namespace}.cli.git; {
    programs.git = {
      enable = true;
      userName = username;
      userEmail = email;
      delta.enable = true;
      extraConfig = {
        branch.sort = "-committerdate";
        commit.verbose = true;
        column.ui = "auto";
        diff = {
          algorith = "histogram";
          colorMoved = "plain";
          mnemonicPrefix = true;
          renames = true;
        };
        fetch = {
          all = true;
          prune = true;
          pruneTags = true;
        };
        init.defaultBranch = "main";
        pull.rebase = true;
        push = {
          autoSetupRemote = true;
          default = "simple";
          followTags = true;
        };
        rebase = {
          autoStash = true;
          autoSquash = true;
          updateRefs = true;
          abbreviateCommands = true;
          missingCommitsCheck = "warn";
        };
        rerere = {
          enabled = true;
          autoupdate = true;
        };
        tag.sort = "version:refname";
      };
    };

    programs.gh = {enable = true;};

    programs.lazygit.enable = true;

    programs.fish.shellAbbrs = {
      lg = "lazygit";
    };
  };
}
