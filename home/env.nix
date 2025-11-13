{
  config,
  pkgs,
  ...
}: let
  scriptPath = "/home/knakto/knakto/nixosConfig/home/config/hyprland/scripts";
in {
  home.sessionPath = [
    "${scriptPath}"
  ];
}
