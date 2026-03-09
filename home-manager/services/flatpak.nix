{ config, ... }:
{
  services.flatpak = {
    enable = true;

    overrides = {
      global = {
        Environment = {
          # Fix un-themed cursor in some Wayland apps
          XCURSOR_PATH = "~/.nix-profile/share/icons";
          # Force correct theme for some GTK apps
          GTK_THEME = config.gtk.theme.name;
          NIXOS_OZONE_WL = "1";
        };
      };
    };

    packages = [
      # { appId = "com.brave.Browser"; origin = "flathub"; }
      {
        appId = "com.stremio.Stremio";
        origin = "flathub";
      }
      {
        appId = "org.vinegarhq.Sober";
        origin = "flathub";
      }
      {
        appId = "in.cinny.Cinny";
        origin = "flathub";
      }
      # "com.stremio.Stremio"
    ];
  };
}
