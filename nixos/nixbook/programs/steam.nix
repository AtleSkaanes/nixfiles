{ pkgs, inputs, ... }:
{
  nixpkgs.overlays = [ inputs.millennium.overlays.default ];

  programs.steam = {
    enable = true;
    # package = inputs.millennium.packages.x86_64-linux.default;
    package = pkgs.steam-millennium;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    remotePlay.openFirewall = true;

    extest.enable = true;
    gamescopeSession = {
      enable = true;
      args = [
        "--expose-wayland"
        "--immediate-flips"
      ];
    };

    extraCompatPackages = with pkgs; [
      proton-ge-custom
    ];
  };
}
