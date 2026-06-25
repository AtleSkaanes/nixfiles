{ pkgs,  ... }:
{
  services.swayidle =
  let
    # Lock command
    lock = "${pkgs.swaylock-effects}/bin/swaylock --daemonize";
    display = status: "${pkgs.niri}/bin/niri msg action power-${status}-monitors";
    brightness_restore = "${pkgs.brightnessctl}/bin/brightnessctl -r";

    dim_t = 300;
    lock_t = 900;
    displayoff_t = 1800;
    suspend_t = 2400;
  in
  {
    enable = false; # Use noctalia shells version
    timeouts = [
      {
        timeout = dim_t; # in seconds
        command = "${pkgs.brightnessctl}/bin/brightnessctl -s set 10";
      }
      {
        timeout = lock_t - 10; # in seconds
        command = "${pkgs.libnotify}/bin/notify-send 'Locking in 10 seconds' -t 10000";
      }
      {
        timeout = lock_t;
        command = lock;
      }
      {
        timeout = displayoff_t;
        command = display "off";
        resumeCommand = display "on";
      }
      {
        timeout = suspend_t;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
    events = {
      # adding duplicated entries for the same event may not work
      "before-sleep" = (display "off") + "; " + lock;
      "after-resume" = display "on" + "; " + brightness_restore;
      "lock" = (display "off") + "; " + lock;
      "unlock" = display "on" + "; " + brightness_restore;
    };
  };
}
