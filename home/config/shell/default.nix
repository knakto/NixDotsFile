{self, ...}:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;

    history = {
      ignoreDups = true;
      save = 1000000;
      size = 1000000;
    };

    shellAliases = {
      v = "nvim .";
      c = "clear";
      open = "xdg-open";
      ls = "eza";
      la = "eza -a";
      nixhome = "home-manager switch --flake ~/knakto/nixosConfig";
      wayland = "export XDG_SESSION_TYPE=wayland";
      x11 = "export XDG_SESSION_TYPE=x11";
      sound = "amixer set Master";
      cd = "z";
      cat = "bat";
      mans = "tldr";
      norm = "/home/knakto/.local/share/pipx/venvs/norminette/bin/norminette";
      dev = "nix develop --command zsh";
    };

    initContent = ''
      fastfetch
      eval "$(fzf --zsh)"
      eval "$(zoxide init zsh)"
    '';

    oh-my-zsh = {
      enable = true;
      # theme = "agnoster";
      theme = "dst";
      plugins = [
        "git"
        "git-extras"
        "man"
        "sudo"
        "systemd"
        "zsh-navigation-tools"
      ];
    };
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      nixhome = "home-manager switch --flake ~/knakto/nixosConfig";
    };
  };
}
