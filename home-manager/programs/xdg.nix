{
  config.xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };

    mime.enable = true;

    # portal = {
    #   enable = true;
    #   extraPortals = with pkgs; [
    #     xdg-desktop-portal
    #     xdg-desktop-portal-gtk
    #   ];
    #   configPackages = with pkgs; [
    #     xdg-desktop-portal
    #     xdg-desktop-portal-gtk
    #   ];
    # };
  };

}
