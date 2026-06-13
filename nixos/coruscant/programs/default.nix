{ pkgs, ... }:
{
  imports = [
    ./gaming
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    file
    vim
    fastfetch
    trash-cli
    clang
    pciutils
    usbutils
    wget
    brightnessctl
    xwayland-satellite
    ntfs3g

  ];

  programs.niri = {
    enable = true;
  };

  programs.zsh.enable = true;
  # get completion for system packages (e.g. systemd).
  environment.pathsToLink = [ "/share/zsh" ];

  programs.nh = {
    enable = true;
    flake = "/home/atle/.config/nixos/";
  };

  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    # Certain features, including CLI integration and system authentication support,
    # require enabling PolKit integration on some desktop environments (e.g. Plasma).
    polkitPolicyOwners = [ "atle" ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
