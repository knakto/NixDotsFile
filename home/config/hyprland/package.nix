{
  inputs,
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # inputs.caelestia-shell.packages.x86_64-linux.default
    swaylock-effects
    swayidle
    # fuzzel
    hyprcursor
    bibata-cursors
  ];
}
