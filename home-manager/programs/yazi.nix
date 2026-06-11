{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    package = pkgs.yazi.override {_7zz = pkgs._7zz-rar; };

    plugins = {
      inherit (pkgs.yaziPlugins) mount piper;
      git = {
        package = pkgs.yaziPlugins.git;
        settings = {
          order = 1500;
        };
        setup = true;
      };
    };

    enableZshIntegration = true;
    shellWrapperName = "y";

    extraPackages = with pkgs; [
      glow
      hexyl
      git
      sqlite
    ];

    settings = {
      plugin = {
        prepend_previewers = [
          # Preview tarballs with tar
          { url = "*.tar*"; run = "piper --format=url -- tar tf \"$1\""; }
          # Preview CSV with bat
          { url = "*.csv"; run = "piper -- bat -p --color=always \"$1\""; }
          # Preview Markdown with glow
          { url = "*.md"; run = "piper -- CLICOLOR_FORCE=1 glow -w=$w -s=dark \"$1\""; }
          # Preview the schema of a SQLite database
          { mime = "application/sqlite3"; run = "piper -- sqlite3 \"$1\" \".schema --indent\""; }
        ];
        append_previewers = [
          # Use hexyl as fallback previewer
          { url = "*"; run = "piper -- hexyl --border=none --terminal-width=$w \"$1\""; }
        ];
        prepend_fetchers = [
          { url = "*"; group = "git"; run = "git"; }
          { url = "*/"; group = "git"; run = "git"; }
        ];
      };
    };
    keymap = {
      mgr.prepend_keymap = [
        {
          on = [ "H" ];
          run = "hidden toggle";
          desc = "Toggle visibility of hidden files";
        }
        {
          on = [ "M" ];
          run = "plugin mount";
        }
      ];
    };
  };

  catppuccin = {
    yazi = {
      enable = true;
      flavor = "mocha";
      accent = "lavender";
    };
  };
}
