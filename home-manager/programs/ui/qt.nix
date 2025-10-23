{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (catppuccin-kvantum.override {
      accent = "lavender";
      variant = "mocha";
    })
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    kdePackages.qt6ct
    papirus-folders
  ];

  qt = {
    enable = true;
    style.name = "kvantum";
    platformTheme.name = "kvantum";
  };
}
