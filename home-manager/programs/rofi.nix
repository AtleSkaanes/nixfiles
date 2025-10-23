{
  config,
  pkgs,
  ...
}:
{

  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    theme = config.xdg.configHome + "/rofi/theme.rasi";
    # theme = "/home/atle/.config/rofi/theme.rasi";

    plugins = with pkgs; [
      # (rofi-calc.override { rofi-unwrapped = rofi-wayland-unwrapped; })
      rofi-calc
      rofi-emoji
    ];
  };
}
