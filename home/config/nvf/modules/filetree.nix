{
  neo-tree = {
    enable = true;
    setupOpts = {
      window = {
        width = 30;
        mappings = {
          "space" = false;
          "l" = "open";
          "h" = "close_node";
          "P" = "toggle_preview";
          "t" = "open_tabnew";
        };
      };
      enable_cursor_hijack = true;
      enable_git_status = true;
      enable_refresh_on_write = true;
      auto_clean_after_session_restore = true;
      git_status_async = true;
    };
  };
}
