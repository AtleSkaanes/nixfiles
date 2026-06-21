{ pkgs, config, lib, ... }:
{
  imports = [
    ../../../packages/zap/hm-module.nix
  ];

  programs.zsh = {
    enable = true;

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
          source <(${pkgs.fzf}/bin/fzf --zsh)
          export FZF_DEFAULT_OPTS=" \
            --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
            --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
            --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
            --color=selected-bg:#45475a \
            --multi"
        '';
        starship = ''
          eval "$(${pkgs.starship}/bin/starship init zsh)"
        '';
        any-nix-shell = ''
          ${pkgs.any-nix-shell}/bin/any-nix-shell zsh | source /dev/stdin
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
        styles = ''
          typeset -A ZSH_HIGHLIGHT_STYLES
          ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=yellow'
          ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=yellow,bold'
        '';
      in
      lib.mkMerge [
        (lib.mkAfter mkdirc)
        (lib.mkAfter find-desktop)
        (lib.mkAfter fzf)
        (lib.mkAfter starship)
        (lib.mkAfter any-nix-shell)
        (lib.mkAfter lineedit)
        (lib.mkAfter keybinds)
        (lib.mkAfter styles)
      ];

    sessionVariables = {
      EDITOR = "nvim";
      CC = "clang";
      CXX = "clang++";
      CPP = "clang-cpp";
    };

    envExtra = ''
      path+=("$HOME/go/bin" "$HOME/.cargo/bin" "$HOME/.local/bin")
      export PATH
    '';
  };
  
  programs.zoxide = {
    enable = true;
    options = [
      "--cmd cd"
    ];
  };

  programs.direnv = {
    enable = true;
  };

  programs.zap = {
    enable = true;
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

  catppuccin.zsh-syntax-highlighting.enable = false;
}
