{ pkgs, inputs, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  home.packages = with pkgs; [
    ddcutil

    # PLUGIN DEPENDS
    grim
    slurp
    wl-clipboard
    tesseract
    imagemagick
    zbar
    curl
    translate-shell
    wf-recorder
    ffmpeg
    gifski
  ];

  # configure options
  programs.noctalia = {
    enable = true;
    settings = {
      bar.default = {
        background_opacity = 0.0;
        capsule = true;
        capsule_opacity = 0.95;
        margin_edge = 5;
        margin_end = 10;
        scale = 0.95;
        thickness = 30;

        start = [
          "control-center"
          "session"
          "media"
          "group:stats"
        ];
        center = [ "workspaces" ];
        end = [
          "privacy"
          "tray"
          "clipboard"
          "group:connections"
          "group:sliders"
          "battery"
          "clock"
          "notifications"
        ];

        capsule_group = [
          {
            fill = "surface_variant";
            id = "connections";
            members = [ "network" "bluetooth" ];
          }
          {
            fill = "surface_variant";
            id = "sliders";
            members = [ "volume" "brightness" ];
          }
          {
            fill = "surface_variant";
            id = "stats";
            members = [ "cpu" "ram" "temp" ];
          }
        ];
      };

      lockscreen = {
        blurred_desktop = true;
      };

      osd = {
        position = "top_right";
        position_vertical = "bottom_right";
        kinds = {
          media = false;
        };
      };

      shell = {
        time_format = "{:%H:%M:%S}";
        panel = {
          control_center_placement = "floating";
          open_near_clicl_control_center = true;
        };
      };

      theme = {
        builtin = "Catppuccin";
        community_palette = "Catppuccin Lavender";
        mode = "dark";
        source = "builtin";
      };

      wallpaper.enable = false;

      widget = {
        clock.format = "{:%H:%M:%S}";

        cpu.show_label = false;
        ram.show_label = false;
        temp.show_label = false;

        tray.drawer = true;

        workspaces = {
          empty_color = "surface_variant";
          minimal = true;
          occupied_color = "on_surface_variant";
        };
      };
    };
  };
}
