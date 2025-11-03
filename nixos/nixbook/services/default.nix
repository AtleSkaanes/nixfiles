{
  pkgs,
  ...
}:
{
  imports = [
    ./keyd.nix
    ./powerprofile.nix
  ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "dk";
    variant = "nodeadkeys";
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
  };

  services.fprintd = {
    enable = true;
    package = pkgs.fprintd-tod;
    tod.enable = true;
    # Search for "libfprint" in packages to find other drivers
    tod.driver = pkgs.libfprint-2-tod1-elan;
  };

  services.scx = {
    enable = true;
    scheduler = "scx_lavd";
    package = pkgs.scx_git.rustscheds;
  };

  services.udisks2.enable = true;
  services.gvfs.enable = true;

  services.flatpak.enable = true;
}
