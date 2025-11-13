{
  config,
  pkgs,
  ...
}: {
  services.mako = {
    enable = true;
    settings = {
      backgroundColor = "#282a36af";
      textColor = "#f4f7fa";
      border-color = "#282a36";
      progress-color = "#00ffff3a";
      border-radius = 5;
      margin = "5, 20";
      width = 375;
      height = 175;
      layer = "overlay";
    };
    extraConfig = ''
      [urgency=low]
      border-color=#879a9c
      default-timeout=7000

      [urgency=normal]
      border-color=#b0cfd1
      default-timeout=10000

      [urgency=high]
      border-color=#d1a8f0'';
  };
}
