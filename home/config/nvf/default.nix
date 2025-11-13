{
  lib,
  pkgs,
  inputs,
  ...
}: let
  inherit (inputs.nvf.lib.nvim.dag) entryAnywhere;
  fromGitHub = ref: repo:
    pkgs.vimUtils.buildVimPlugin {
      pname = lib.strings.sanitizeDerivationName repo;
      version = ref;
      src = builtins.fetchGit {
        url = "https://github.com/${repo}.git";
        rev = ref;
        allRefs = true;
      };
    };
in {
  programs.nvf = {
    enableManpages = true; #for man 5 nvf
    enable = true;
    settings = {
      vim = {
        viAlias = false;
        vimAlias = true;
        theme = {
          enable = true;
          name = "catppuccin";
          style = "auto";
        };
        statusline.lualine = {
          enable = true;
          theme = "onedark";
        };
        debugger = {
          nvim-dap = {
            enable = true;
            ui.enable = true;
          };
        };
        telescope = {
          enable = true;
          extensions = [
            {
              name = "fzf";
              packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
              setup = {fzf = {fuzzy = true;};};
            }
            {
              name = "ui-select";
              packages = [pkgs.vimPlugins.telescope-ui-select-nvim];
              # setup = {fzf = {fuzzy = true;};};
            }
          ];
        };
        comments = {
          comment-nvim.enable = true;
        };

        binds = {
          whichKey.enable = true;
        };

        treesitter = {
          enable = true;
          autotagHtml = true;
        };

        lsp = {
          enable = true;
          null-ls.enable = true;
          mappings.hover = "J";
        };

        diagnostics = {
          enable = true;
          config.virtual_text = true;
        };

        utility = {
          images = {
            image-nvim = {
              enable = true;
              setupOpts.backend = "kitty";
            };
            img-clip.enable = true;
          };
          preview.markdownPreview.enable = true;
        };

        ui = {
          borders.enable = true;
          noice.enable = true;
          colorizer.enable = true;
          illuminate.enable = true;
          breadcrumbs = {
            enable = true;
            navbuddy.enable = true;
          };
        };

        autocomplete = import ./modules/autocomplete.nix;
        languages = import ./modules/language.nix;
        visuals = import modules/visual.nix;
        tabline = import ./modules/tabline.nix;
        filetree = import ./modules/filetree.nix;
        notes = import ./modules/note.nix;
        keymaps = import ./modules/keymap.nix;
        options = {
          smartindent = true;
          expandtab = false;
          shiftwidth = 4;
          softtabstop = -1;
          tabstop = 4;
          list = true;
        };
        luaConfigRC.aerial-nvim = entryAnywhere ''
          vim.opt.conceallevel = 2
          vim.opt.backspace = { 'indent', 'eol', 'start' }
          vim.opt.listchars = { space = '⋅', tab = '→ ', eol = '↴' }
        '';
        extraPlugins = with pkgs.vimPlugins; {
          # lualine-nvim = import ./modules/lualine {inherit config pkgs;};
          copilot-vim = {
            package = copilot-vim;
            setup = ''
              --require('copilot').setup {}
              vim.keymap.set('i', '<m-l>', 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })
              vim.g.copilot_no_tab_map = true
              vim.g.copilot_assume_mapped = true
              vim.g.copilot_cr_tab_map = true
            '';
          };
          # CopilotChat-nvim = {
          #   package = CopilotChat-nvim;
          #   setup = ''
          #     require("CopilotChat").setup({
          #       window = {
          #         layout = 'float',
          #         width = 0.5,
          #         height = 0.5,
          #         relative = 'editor',
          #         border = 'single',
          #         row = nil,
          #         col = nil,
          #         title = 'OhChat',
          #         footer = nil,
          #         zindex = 1,
          #       },
          #     })
          #     vim.keymap.set({"n", "i", "v"}, "<C-c>", ":CopilotChatToggle<CR>", { desc = "copilot" })
          #   '';
          # };
          toggleterm-nvim = {
            package = toggleterm-nvim;
            setup = ''
              require("toggleterm").setup({
                function(term)
                  if term.direction == "horizontal" then
                    return 17
                  elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                  end
                end,
                open_mapping = [[<c-\>]],
                direction = "float",
              })
            '';
          };
          # neogit = {
          #   package = neogit;
          #   setup = ''vim.keymap.set("n", '<C-g>', ":Neogit<CR>", { desc = "Neogit" })'';
          # };
          smear-cursor-nvim = {
            package = smear-cursor-nvim;
            setup = ''
              require('smear_cursor').setup({
              opts = {
                stiffness = 0.8,
                trailing_stiffness = 0.6,
                distance_stop_animating = 1,
                hide_target_hack = false,
                legacy_computing_symbols_support = true,
                cterm_bg = 235,
                smear_insert_mode = false,
                },
              })
            '';
          };
          smooth-cursor-nvim = {
            package = fromGitHub "12518b284e1e3f7c6c703b346815968e1620bee2" "gen740/SmoothCursor.nvim";
            setup = ''
              require('smoothcursor').setup({
                cursor = "▷",
                fancy = {
                 enable = true,
                 head = { cursor = "", texthl = "SmoothCursor", linehl = nil }, -- false to disable fancy head
                 body = {
              	{ cursor = "󰝥", texthl = "SmoothCursorRed" },
              	{ cursor = "󰝥", texthl = "SmoothCursorOrange" },
              	{ cursor = "●", texthl = "SmoothCursorYellow" },
              	{ cursor = "●", texthl = "SmoothCursorGreen" },
              	{ cursor = "•", texthl = "SmoothCursorAqua" },
              	{ cursor = ".", texthl = "SmoothCursorBlue" },
              	{ cursor = ".", texthl = "SmoothCursorPurple" },
                },
                tail = { cursor = nil, texthl = "SmoothCursor" } -- false to disable fancy tail,
              },
              speed = 50,
               })
            '';
          };
          header_42 = {
            package = fromGitHub "9e816c72712ac72aa576b18a14a5427578c90ff7" "Diogo-ss/42-header.nvim";
            setup = ''
              require('42header').setup({
                   default_map = true,
                   auto_update = true,
                   user = "knakto",
                   mail = "knakto@student.42bangkok.com",
              });
            '';
          };
          fugitive = {
            package = vim-fugitive;
          };
          conflict_marker = {
            package = conflict-marker-vim;
          };
          git_conflict = {
            package = git-conflict-nvim;
            setup = ''require('git-conflict').setup()'';
          };
          telescope_git = {
            package = telescope-git-conflicts-nvim;
            setup = ''
              require("telescope").load_extension("conflicts")
              vim.keymap.set({"n", "v", "i"}, '<C-g>', ":Telescope conflicts<CR>", { desc = "conflict" })
            '';
            # [co] = — choose ours
            # [ct] = — choose theirs
            # [cb] = — choose both
            # [c0] = — choose none
          };
          neoscroll = {
            package = neoscroll-nvim;
            setup = ''
              require('neoscroll').setup()
            '';
          };
          vim-ipython = {
            package = vim-ipython;
            setup = '''';
          };
          iron-nvim = {
            package = iron-nvim;
            setup = ''${builtins.readFile ./setup/iron-nvim.lua}'';
          };
          venn-nvim = {
            package = venn-nvim;
            setup = ''
              function _G.Toggle_venn()
                  local venn_enabled = vim.inspect(vim.b.venn_enabled)
                  if venn_enabled == "nil" then
                      vim.b.venn_enabled = true
                      vim.cmd[[setlocal ve=all]]
                      -- draw a line on HJKL keystokes
                      vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", {noremap = true})
                      vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", {noremap = true})
                      vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", {noremap = true})
                      vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", {noremap = true})
                      -- draw a box by pressing "f" with visual selection
                      vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", {noremap = true})
                      vim.api.nvim_buf_set_keymap(0, "v", "F", ":VBoxD<CR>", {noremap = true})
                  else
                      vim.cmd[[setlocal ve=]]
                      vim.api.nvim_buf_del_keymap(0, "n", "J")
                      vim.api.nvim_buf_del_keymap(0, "n", "K")
                      vim.api.nvim_buf_del_keymap(0, "n", "L")
                      vim.api.nvim_buf_del_keymap(0, "n", "H")
                      vim.api.nvim_buf_del_keymap(0, "v", "f")
                      vim.b.venn_enabled = nil
                  end
              end
              -- toggle keymappings for venn using <leader>v
              vim.api.nvim_set_keymap('n', '<leader>v', ":lua Toggle_venn()<CR>", { noremap = true})
            '';
          };
          conform-nvim = {
            package = conform-nvim;
            setup = ''
              vim.g.autoformat = false -- disable globally first
              require("conform").setup({
                -- formatter ที่จะใช้สำหรับแต่ละ filetype
                formatters_by_ft = {
                  -- สำหรับ TypeScriptReact (.tsx)
                  typescriptreact = { "prettier" },
                  -- คุณสามารถเพิ่มภาษาอื่นได้ที่นี่ เช่น:
                  -- javascript = { "prettier" },
                  -- typescript = { "prettier" },
                },

                -- ตั้งให้ conform format ตอน save
                format_on_save = function(bufnr)

                if vim.g.autoformat == false then
                 return
                end

                return {
                  timeout_ms = 500,
                  lsp_fallback = true, -- ถ้าไม่มี formatter ให้ลองใช้ LSP
                }

                end,
                })

              -- 💡 สร้าง keymap manual format ได้ด้วย
              vim.keymap.set("n", "<leader>lF", function()
                require("conform").format({ async = true, lsp_fallback = true })
              end, { desc = "Format current buffer" })

              vim.keymap.set("n", "<leader>uf", function()
                vim.g.autoformat = not vim.g.autoformat
                print("Autoformat: " .. (vim.g.autoformat and "ON" or "OFF"))
              end, { desc = "Toggle autoformat on save" })
            '';
          };
          nvim-surround = {
            package = nvim-surround;
            setup = ''require("nvim-surround").setup()'';
          };
        };
      };
    };
  };
}
