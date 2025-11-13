{
  config,
  pkgs,
  ...
}: let
  bindings = import ./binding.nix;
in {
  imports = [
    ./caelestia.nix
    ./notification.nix
    ./package.nix
    ./locker.nix
    ./launcher.nix
    ./hyprlock.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      input = {
        kb_layout = "us,th";
        kb_options = "grp:win_space_toggle";
      };
      xwayland = {
        force_zero_scaling = true;
        use_nearest_neighbor = true;
      };
      debug = {
        disable_logs = true;
      };
      general = {
        # gaps_in = 14;
        gaps_out = 9;
        border_size = 2;
        layout = "dwindle";
        resize_on_border = true;
      };
      decoration = {
        rounding = 8;
      };
      exec-once = [
        # "hibernate.sh"
        "caelestia shell"
      ];
      env = [
        "XCURSOR_THEME,Bibata-Modern-Ice"
        "XCURSOR_SIZE,24"
      ];

      animations = import ./animation.nix;
      bind = bindings.bind;
      bindel = bindings.bindel;
      bindl = bindings.bindl;
      bindm = bindings.bindm;
    };
  };
}
