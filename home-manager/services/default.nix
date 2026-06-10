{
  imports = [
    ./swayidle.nix
    ./flatpak.nix
  ];

  services.mpris-proxy.enable = true;
}
