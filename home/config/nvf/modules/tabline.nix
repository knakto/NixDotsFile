{
  nvimBufferline = {
    enable = true;
    mappings.cycleNext = "L";
    mappings.cyclePrevious = "H";
    setupOpts = {
      options = {
        show_buffer_close_icons = false;
        indicator.style = "none";
        separator_style = "slope";
        numbers = "none";
        tab_size = 20;
        line_height = 3;
        offsets = [
          {
            filetype = "neo-tree";
            highlight = "Directory";
            separator = true;
            text = "File Explorer";
            text_align = "center";
          }
        ];
      };
    };
  };
}
