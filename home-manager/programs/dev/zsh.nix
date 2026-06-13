{ pkgs, config, lib, ... }:
{
  imports = [
    ../../../packages/zap/hm-module.nix
  ];

  programs.zsh = {
    enable = true;

    # defaultKeymap = "viins";

    shellAliases = {
      ls = "eza";
      ll = "eza -alF";
      edit = "sudo -e";
      lg = "lazygit";
      rm = "trash-put";
      CC = "$CC";
      CXX = "$CXX";
      weekn = "date +%U";
    };

    dotDir = "${config.xdg.configHome}/zsh";

    history = {
      ignoreDups = true;
      size = 10000;
    };

    initContent = 
      let
        mkdirc = ''
          function mkdirc {
            local nonFlags=()
            for arg in $@; do
              if [[ $arg != "-"* ]]; then
                nonFlags+=($arg)
              fi
            done

            mkdir $@
            cd $nonFlags
          }
        '';
        find-desktop = ''
          function find-desktop() {
            find /run/current-system/sw/share/applications/ ~/.nix-profile/share/applications/ -name "$1"
          }
        '';
        fzf = ''
          source <(fzf --zsh)
          export FZF_DEFAULT_OPTS=" \
            --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
            --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
            --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
            --color=selected-bg:#45475a \
            --multi"
        '';
        starship = ''
          eval "$(starship init zsh)"
        '';
        lineedit = ''
          autoload -U edit-command-line
          zle -N edit-command-line
          bindkey "^xe" edit-command-line
          bindkey "^x^e" edit-command-line
        '';
        keybinds = ''
          bindkey "^[[1;5C" forward-word
          bindkey "^[[1;50" backward-word
          bindkey "\e[3~" delete-char
        '';
      in
      lib.mkMerge [
        (lib.mkAfter mkdirc)
        (lib.mkAfter find-desktop)
        (lib.mkAfter fzf)
        (lib.mkAfter starship)
        (lib.mkAfter lineedit)
        (lib.mkAfter keybinds)
      ];
  };
  
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [
      "--cmd cd"
    ];
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zap = {
    enable = true;
    enableZshIntegration = true;
    plugins = {
      enableAutoSuggestions = true;
      enableSupercharge = true;
      enableSyntaxHighlighting = true;
      enablePrompt = false;
    };
  };

  home.packages = with pkgs; [
    starship
  ];
}
