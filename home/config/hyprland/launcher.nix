{
  config,
  pkgs,
  ...
}: {
  programs.fuzzel = {
    enable = true;
    #
    # settings = {
    #   main = {
    #     font = "FiraCode:size=12";
    #     terminal = "alacritty";
    #   };
    #
    #   colors = {
    #     background = "1e1e2eff"; # dark background
    #     text = "c0caf5ff"; # light text
    #     selection = "414868ff"; # selected item bg
    #     "selection-text" = "f8f8f2ff"; # selected item text
    #     border = "7aa2f7ff"; # border color
    #   };
    # };
  };
}
