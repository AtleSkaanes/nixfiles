{ pkgs, inputs, ... }:
{
  imports = [
    ./dev
    ./gaming
    ./ui
    ./noctalia.nix
    ./rofi.nix
    ./xdg.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    inputs.zen-browser.packages.x86_64-linux.default
    inputs.batlert.packages.x86_64-linux.default

    fd
    libnotify

    tidal-hifi
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
    pcmanfm
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
    wdisplays
    networkmanagerapplet
    blueman
    adw-bluetooth
    obsidian
    zoxide
    pwvucontrol
    stow
    warp # NOT THE TERMINAL, DON'T WORRY
    clipse

    man-pages
    glibcInfo
    quickemu
    qemu

    libreoffice-qt6-fresh

    solaar

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
}
