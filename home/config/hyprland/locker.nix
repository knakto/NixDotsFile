{
  config,
  pkgs,
  ...
}: {
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      screenshots = true;
      effect-blur = "7x5";
      effect-vignette = "0.5:0.5";
      line-color = "0xFFFFFF";
      fade-in = 0.2;
      indicator = true;
      indicator-thickness = 5;
      clock = true;
    };
  };
}
