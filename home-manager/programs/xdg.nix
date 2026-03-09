let
  browser = {
    name = "zen";
    desktop = "zen.desktop";
  };
  editor = {
    name = "nvim";
    desktop = "nvim.desktop";
  };
  pdf_viewer = {
    name = "zathura";
    desktop = "org.pwmt.zathura-ps.desktop";
    # name = "sioyek";
    # desktop = "sioyek.desktop";
  };
  image_viewer = {
    name = "eog";
    desktop = "org.gnome.eog.desktop";
  };
  video_viewer = {
    name = "mpv";
    desktop = "mpv.desktop";
  };
in
{
  config.xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };

    mime.enable = true;

    mimeApps = {
      enable = true;
      defaultApplications = {
        # BROWSER
        "text/html" = browser.desktop;
        "x-scheme-handler/http" = browser.desktop;
        "x-scheme-handler/https" = browser.desktop;
        "x-scheme-handler/about" = browser.desktop;
        "x-scheme-handler/unknown" = browser.desktop;

        # DOCUMENTS
        "application/pdf" = pdf_viewer.desktop;

        # IMAGES
        "image/png" = image_viewer.desktop;
        "image/jpg" = image_viewer.desktop;
        "image/gif" = image_viewer.desktop;
        "image/bmp" = image_viewer.desktop;
        "image/xyz" = image_viewer.desktop;
        "image/svg" = browser.desktop;
        "image/webp" = browser.desktop;

        # VIDEO
        "video/webm" = browser.desktop;
        "video/ogg" = video_viewer.desktop;
        "video/mpeg" = video_viewer.desktop;
        "video/mp4" = video_viewer.desktop;

        # CODE
        "application/x-sh" = editor.desktop;

        # TEXT
        "text/plain" = editor.desktop;
        "text/x-csharp" = editor.desktop;
        "application/xml" = editor.desktop;
        "text/xml" = editor.desktop;
        "application/json" = editor.desktop;
        "text/markdown" = editor.desktop;
      };
    };

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
