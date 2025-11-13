{config, pkgs, ...}: let
  display = "sddm"; #gdm sddm lightdm
  desktop = "plasma6"; #gnome plasma5 plasma6 xfce lxqt
in {
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us, th";
      variant = "";
      options = "grp:win_space_toggle";
    };
    displayManager = {
      ${display}.enable = true;
    };
    desktopManager = {
      ${desktop}.enable = true;
    };
  };
}
