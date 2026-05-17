{ pkgs, ... }:
{
  home.packages = with pkgs; [
    prismlauncher
    # lutris
    (heroic.override {
      extraPkgs = pkgs: [
        pkgs.gamescope
      ];
    })
  ];
}
