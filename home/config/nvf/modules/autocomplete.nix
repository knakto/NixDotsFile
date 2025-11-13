{
  nvim-cmp = {
    enable = true;
    sources = {
      luasnip = "[Luasnip]";
      nvim_lsp = "[LSP]";
      path = "[Path]";
      buffer = "[Buffer]";
    };
    sourcePlugins = ["luasnip"];
    setupOpts = {
      completion = {
        autocomplete = false;
        completeopt = "menu,menuone,noinsert";
      };
      autocomplete.nvim-cmp.mappings = {
        complete = "<C-Space>";
        confirm = "<CR>";
        close = "<C-e>";
        scrollDocsDown = "<C-f>";
        scrollDocsUp = "<C-d>";

        next = "cmp.mapping(function(fallback)
                    if cmp.visible() then
                      cmp.select_next_item()
                    else
                      fallback()
                    end
                  end, {'i','s'})";

        previous = "cmp.mapping(function(fallback)
                    if cmp.visible() then
                      cmp.select_prev_item()
                    else
                      fallback()
                    end
                  end, {'i','s'})";
      };
      sorting = {
        comparators = [
          {
            _type = "lua-inline";
            expr = "deprio(require('cmp.types').lsp.CompletionItemKind.Text)";
          }
          {
            _type = "lua-inline";
            expr = "deprio(require('cmp.types').lsp.CompletionItemKind.Snippet)";
          }
          "offset"
          "exact"
          "score"
          "kind"
          "length"
          "sort_text"
        ];
      };
    };
    # mappings.next = "<Down>";
    # mappings.previous = "<Up>";
  };
}
