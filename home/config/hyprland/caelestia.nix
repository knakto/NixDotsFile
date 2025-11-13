{
  config,
  pkgs,
  ...
}: {
  programs.caelestia = {
    enable = true;
    systemd = {
      enable = false;
      target = "graphical-session.target";
      environment = [];
    };
    settings = {
      bar.status = {
        showBattery = false;
      };
      paths.wallpaperDir = "~/knakto/nixosConfig/images";
    };
    cli = {
      enable = true;
      settings = {
        theme.enableGtk = false;
      };
    };
  };
}
