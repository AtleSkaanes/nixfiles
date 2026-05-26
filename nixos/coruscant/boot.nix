# { pkgs, ... }:
{
  boot = {
    # kernelPackages = pkgs.linuxPackages_cachyos-lto;
    loader = {
      # Hide the OS choice for bootloaders.
      # It's still possible to open the bootloader list by pressing any key
      # It will just not appear on screen unless a key is pressed
      timeout = 5;

      systemd-boot.enable = false;
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        device = "nodev";
        # useOSProber = true;
        efiSupport = true;
      };

    };

    plymouth = {
      enable = true;
    };

    # Enable "Silent boot"
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
      "btusb.enable_autosuspend=0"
    ];

    kernelModules = [ "ntsync" "mt7921e" ];

    supportedFilesystems = [ "ntfs" ];
  };
}
