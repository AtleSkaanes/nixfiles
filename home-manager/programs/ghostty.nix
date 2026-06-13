{ lib, ... }:
{
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "Catppuccin Mocha";
      font-family = "JetBrainsMono NerdFont";
      background-opacity = 0.95;
      background-blur = true;
      background-opacity-cells = true;

      bell-features = "border";
      shell-integration-features = ["ssh-env" "ssh-terminfo"];
    };
  };

  xdg.terminal-exec = {
    enable = true;
    settings.default = lib.singleton "com.mitchellh.ghostty.desktop";
  };

  home.sessionVariables = {
    TERM = "xterm-ghostty";
    TERMINAL = "xterm-ghostty";
  };
}
