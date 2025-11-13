{
  #   obsidian = {
  #     enable = true;
  #     setupOpts = {
  #       completion.nvim_cmp = true;
  #       workspaces = [
  #         {
  #           name = "braincell";
  #           path = "~/knakto/vaults/braincell";
  #         }
  #         {
  #           name = "work";
  #           path = "~/knakto/vaults/work";
  #         }
  #       ];
  #       mappings = {
  #         "gf" = ''
  #           action = function()
  #               return require("obsidian").util.gf_passthrough()
  #           end,
  #           opts = { noremap = false, expr = true, buffer = true },'';
  #         "<leader>ch" = ''
  #           action = function()
  #             return require("obsidian").util.toggle_checkbox()
  #           end,
  #           opts = { buffer = true },'';
  #         "<cr>" = ''
  #           action = function()
  #             return require("obsidian").util.smart_action()
  #           end,
  #           opts = { buffer = true, expr = true },'';
  #       };
  #     };
  #   };
  neorg.enable = false;
  orgmode.enable = false;
  mind-nvim.enable = true;
  todo-comments.enable = true;
}
