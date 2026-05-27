{ pkgs, config, ... }:
{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      indicator-idle-visible = true;
      image = "${config.xdg.configHome}/global/wallpapers/current/wallpaper_blur.png";
      clock = true;
    };
  };
}
