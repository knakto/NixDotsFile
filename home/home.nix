{
  pkgs,
  lib,
  ...
}: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "google-chrome"
      "minecraft-launcher"
      "obsidian"
      "steam"
      "steam-unwrapped"
      "unityhub"
      "spotify"
      "copilot.vim"
      "corefonts"
	"vscode"
    ];
  imports = [
    ./env.nix
    ./package.nix
    ./config/kitty
    # ./config/neovim
    ./config/nvf
    ./config/shell
    ./config/git
    ./config/fastfetch
    ./config/hyprland
  ];
  home = {
    username = "knakto";
    homeDirectory = "/home/knakto";
    stateVersion = "24.11";
  };
}
