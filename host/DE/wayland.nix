{
  config,
  pkgs,
  ...
}: {
  services.xserver.enable = false;

  programs.hyprland.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
    config = {
      common = {
        default = ["hyprland" "gtk"];
        # "org.freedesktop.impl.portal.FileChooser" = "gtk";
      };
    };
  };

  services.xserver.xkb = {
    layout = "us,th";
    variant = "";
    options = "grp:win_space_toggle";
  };

  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
    };
    autoLogin = {
      enable = true;
      user = "knakto";
    };
  };
}
