{ pkgs, self, ... }:
{
  imports = [
    ./steam.nix
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    self.packages.x86_64-linux.observer
    vim
    fastfetch
    trash-cli
    clang
    btop
    usbutils
    wget
    brightnessctl
    xwayland-satellite
  ];

  programs.niri = {
    enable = true;
  };

  programs.zsh.enable = true;
  programs.nh = {
    enable = true;
    flake = "/home/atle/.config/nixos/";
  };
  # programs.hyprpanel.enable = true;

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
