{ pkgs, inputs, ... }:
{
  imports = [
    ./dev
    ./gaming
    ./ui
    ./noctalia.nix
    ./typst.nix
    ./swaylock.nix
    ./rofi.nix
    ./xdg.nix
  ];

  home.packages = with pkgs; [
    inputs.zen-browser.packages.x86_64-linux.default
    inputs.batlert.packages.x86_64-linux.default
    solitaire-tui
    
    wayscriber
    gcr

    inkscape-with-extensions
  
    element-desktop
    vesktop

    presenterm
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
    cowsay
    neovim
    ghostty
    kitty
    playerctl
    fzf
    eza
    awww
    nautilus
    pcmanfm
    yazi
    mpv
    yt-dlp
    eog
    zathura
    sioyek
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
