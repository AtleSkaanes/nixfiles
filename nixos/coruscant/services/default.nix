{
  pkgs,
  ...
}:
{
  imports = [
    ./keyd.nix
    ./secret.nix
    ./calendar.nix
    ./tailscale.nix
    ./vpn.nix
  ];

  services.upower.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "dk";
    # variant = "nodeadkeys";
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
  };

  services.scx = {
    enable = true;
    scheduler = "scx_bpfland";
    package = pkgs.scx.rustscheds;
  };

  services.udisks2.enable = true;
  services.gvfs.enable = true;

  services.flatpak.enable = true;
}
