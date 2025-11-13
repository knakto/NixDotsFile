[
  {
    key = "<leader>oe";
    mode = ["n" "v"];
    action = ":ObsidianTemplate<CR>";
    silent = true;
    desc = "obsidian template";
  }
  {
    key = "<leader>of";
    mode = ["n" "v"];
    action = ":s/\\(#\\)[^_]*_/\\1/ | s/-/ /g<CR>";
    silent = true;
    desc = "format obsidian note";
  }
  {
    key = "<leader>os";
    mode = ["n" "v"];
    action = ":ObsidianSearch<CR>";
    silent = true;
    desc = "search obsidian note";
  }
  {
    key = "<leader>or";
    mode = ["n" "v"];
    action = ":ObsidianRename<CR>";
    silent = true;
    desc = "rename obsidian note";
  }
  {
    key = "<leader>oi";
    mode = ["n" "v"];
    action = ":ObsidianPasteImg<CR>";
    silent = true;
    desc = "obsidian paste image";
  }
  {
    key = "<leader>ow";
    mode = ["n" "v"];
    action = ":ObsidianWorkspace<CR>";
    silent = true;
    desc = "open obsidian workspace";
  }
  {
    key = "<leader>op";
    mode = ["n" "v"];
    action = ":ObsidianOpen<CR>";
    silent = true;
    desc = "close obsidian note";
  }
  {
    key = "<leader>oo";
    mode = ["n" "v"];
    action = ":ObsidianQuickSwitch<CR>";
    silent = true;
    desc = "open obsidian quick switch";
  }
  {
    key = "<leader>oll";
    mode = ["v"];
    action = ":ObsidianLink<CR>";
    silent = true;
    desc = "insert obsidian link";
  }
  {
    key = "<leader>oln";
    mode = ["v"];
    action = ":ObsidianLinkNew<CR>";
    silent = true;
    desc = "new obsidian link";
  }
  {
    key = "<leader>oll";
    mode = ["n"];
    action = ":obsidianFollowLink<CR>";
    silent = true;
    desc = "insert obsidian link";
  }
  {
    key = "<leader>oln";
    mode = ["n"];
    action = ":ObsidianFollowLink<CR>";
    silent = true;
    desc = "new obsidian link";
  }
  {
    key = "<leader>olm";
    mode = ["n" "v"];
    action = ":ObsidianLinks<CR>";
    silent = true;
    desc = "open manage obsidian links";
  }
  {
    key = "<leader>on";
    mode = ["n"];
    action = ":ObsidianNew<CR>";
    silent = true;
    desc = "new obsidian note";
  }
  {
    key = "<leader>om";
    mode = ["n"];
    action = ":ObsidianNewFromTemplate<CR>";
    silent = true;
    desc = "new obsidian note from template";
  }
  {
    key = "<leader>ot";
    mode = ["n"];
    action = ":ObsidianTag<CR>";
    silent = true;
    desc = "insert obsidian tag";
  }
  {
    key = "<C-n>";
    mode = ["n"];
    action = ":Neotree toggle<CR>";
    silent = true;
    desc = "toggle neo-tree";
  }
  {
    key = "<C-h>";
    mode = ["n" "i" "v"];
    action = "<C-w>h";
    silent = true;
    desc = "move to window left";
  }
  {
    key = "<C-j>";
    mode = ["n" "i" "v"];
    action = "<C-w>j";
    silent = true;
    desc = "move to window down";
  }
  {
    key = "<C-k>";
    mode = ["n" "i" "v"];
    action = "<C-w>k";
    silent = true;
    desc = "move to window up";
  }
  {
    key = "<C-l>";
    mode = ["n" "i" "v"];
    action = "<C-w>l";
    silent = true;
    desc = "move to window right";
  }
  {
    key = "<leader>bd";
    mode = ["n" "v"];
    action = "<leader>bd";
    silent = true;
    desc = "delete window";
  }
  {
    key = "<C-C>";
    mode = ["v"];
    action = ''"+y'';
    silent = true;
    desc = "copy to clipboard";
  }
  {
    key = "bd";
    mode = ["n"];
    action = ":bd<CR>";
    silent = true;
    desc = "Delete window";
  }
  {
    key = "<M-o>";
    mode = ["n"];
    action = ":put _<CR>";
    silent = true;
    desc = "Newline under";
  }
  {
    key = "<M-O>";
    mode = ["n"];
    action = ":put! _<CR>";
    silent = true;
    desc = "Newline upper";
  }
  {
    key = "<C-m>";
    mode = ["n" "v"];
    action = ":Markview Toggle<CR>";
    silent = true;
    desc = "Toggle Markview";
  }
]
