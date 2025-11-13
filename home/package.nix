{pkgs, ...}: {
  home.packages = with pkgs; [
    home-manager
    google-chrome
    obsidian
    vesktop
    killall
    handlr
    feh #open picture
    valgrind
    pciutils #lspci
    gparted
    miru
    wine
    docker
    bear
    gnumake
    unityhub
    docker-compose
    spotify
    spotify-cli-linux
    vim
    obs-studio
    krita
    mono
    nnn
    nemo
    rclone
    #--------------------------------#
    ripgrep
    libGL
    htop
    btop
    curl
    tree
    #--------------------------------#
    clang-tools
    clang
    nixd
    # python3
    (python3.withPackages (ps: [
      ps.numpy
      ps.pandas
      ps.pandas-stubs
      ps.matplotlib
    ]))
    pipx
    nodejs_22
    norminette
    cargo # for nvim format
    #--------------------------------#
    vinegar
    pavucontrol
    guitarix
    vscode
    pnpm
    # imagemagick
    steam
  ];
}
