{ pkgs, ... }:
{
  home.packages = with pkgs; [
    prismlauncher
    (heroic.override {
      extraPkgs = pkgs: [
        pkgs.gamescope
      ];
    })
  ];
}
