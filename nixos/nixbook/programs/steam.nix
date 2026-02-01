{ pkgs, ... }:
{
  environment.sessionVariables = {
    PROTON_ENABLE_WAYLAND = 1;
    PROTON_USE_NTSYNC = 1;
  };

  programs.steam = {
    enable = true;
    # package = inputs.millennium.packages.x86_64-linux.default;
    package = pkgs.steam;
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
