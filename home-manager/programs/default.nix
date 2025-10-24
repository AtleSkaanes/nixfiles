{ pkgs, inputs, ... }:
{
  imports = [
    ./gaming
    ./dev
    ./ui
    ./rofi.nix
    ./xdg.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    inputs.zen-browser.packages.x86_64-linux.default
    inputs.batlert.packages.x86_64-linux.default

    wl-mirror
    brave
    bat
    zip
    unzip
    wl-clipboard
    libqalculate
    ripgrep
    rlwrap
    wlogout
    lazygit
    wtype
    imagemagick

    alacritty
    swaylock
    cowsay
    neovim
    vesktop
    ghostty
    kitty
    playerctl
    swaynotificationcenter
    swayosd
    fzf
    eza
    swww
    nautilus
    yazi
    mpv
    eog
    zathura
    starship
    transmission_4-qt
    gnome-clocks
    gnome-text-editor

    firefox
    waybar
    networkmanagerapplet
    blueman
    obsidian
    zoxide
    pwvucontrol
    stow
    warp # NOT THE TERMINAL, DON'T WORRY
    clipse

    man-pages
    glibcInfo

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
}
