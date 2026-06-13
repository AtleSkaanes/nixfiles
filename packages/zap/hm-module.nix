{ config, lib, pkgs, ... }:
{
  options.programs.zap = {
    enable = lib.mkEnableOption "Whether to enable Zap, a Zsh plugin manager";

    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.callPackage ./default.nix {}; 
      description = "The Zap package to use.";
    };

    plugins = {
      enableSyntaxHighlighting = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Whether to enable syntax highlighting";
      };
      enableSupercharge = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Whether to enable supercharge";
      };
      enablePrompt = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Whether to enable zap prompt";
      };
      enableAutoSuggestions = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Whether to enable auto suggestions";
      };
    };
  };

  config =
  let
    cfg = config.programs.zap;
  in lib.mkIf cfg.enable {
    home.packages = [ cfg.package ];

    programs.zsh.initContent = 
      let
        init = ''
          [ -f "${cfg.package}/share/zap/zap.zsh" ] && source "${cfg.package}/share/zap/zap.zsh"
        '';
        plugHighlighting = ''
          plug "zsh-users/zsh-syntax-highlighting"
        '';
        plugSupercharge = ''
          plug "zap-zsh/supercharge"
        '';
        plugPrompt = ''
          plug "zap-zsh/zap-prompt"
        '';
        plugAutoSuggestions = ''
          plug "zsh-users/zsh-autosuggestions";
        '';
        completionSystem = ''
          autoload -Uz compinit
          compinit
        '';
        in
      lib.mkMerge [
         (lib.mkBefore init)
         (lib.mkIf cfg.plugins.enableSyntaxHighlighting (lib.mkBefore plugHighlighting))
         (lib.mkIf cfg.plugins.enableSupercharge (lib.mkBefore plugSupercharge))
         (lib.mkIf cfg.plugins.enablePrompt (lib.mkBefore plugPrompt))
         (lib.mkIf cfg.plugins.enableAutoSuggestions (lib.mkBefore plugAutoSuggestions))
        (lib.mkBefore completionSystem)
      ];
  };
}
