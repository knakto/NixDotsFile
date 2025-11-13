{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    clazy
    # astyle
    lua-language-server
    alejandra
    cmake-format
  ];
  programs.neovim = let
    fromGitHub = repo: ref:
      pkgs.vimUtils.buildVimPlugin {
        pname = lib.strings.sanitizeDerivationName repo;
        version = ref;
        src = builtins.fetchGit {
          url = "https://github.com/${repo}.git";
          rev = ref;
        };
      };
  in {
    enable = true;
    vimAlias = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      oxocarbon-nvim # colorscheme
      neo-tree-nvim # file expoler
      {
        # syntax highlighting
        plugin = nvim-treesitter.withPlugins (p:
          with p; [
            nix
            vim
            bash
            lua
            python
            json
            c
            rust
          ]);
      }
      nvim-lspconfig #lsp client
      mason-nvim # language server resource
      mason-lspconfig-nvim # have to config lsp
      (fromGitHub "nvimtools/none-ls.nvim" "5cf63841461b49989972d35bf886e076a1ab3649")

      telescope-nvim
      telescope-fzf-native-nvim
      plenary-nvim
      nvim-web-devicons
      nui-nvim
      cmp_luasnip
      # friendly-snippets
      # diffview-nvim
      # fzf-lua
      # mini-pick
      # dressing-nvim
      # img-clip-nvim
      # render-markdown-nvim
      # markdown-nvim
      #
      # #ultilitiles
      toggleterm-nvim
      # neogit
      # #obsidian-nvim
      # todo-comments-nvim
      # bufferline-nvim
      (fromGitHub "Diogo-ss/42-header.nvim" "9e816c72712ac72aa576b18a14a5427578c90ff7")
      #
      # #completions
      cmp-nvim-lsp
      nvim-cmp
      luasnip
	  cmp_luasnip
	  friendly-snippets
      # copilot-cmp
      # #copilot-vim
      lualine-nvim
      # CopilotChat-nvim
      # ChatGPT-nvim
    ];
    #     extraConfig = ''
    #       			lua <<EOF
    #       			${builtins.readFile ./init.lua}
    # EOF
    #     '';
  };
}
