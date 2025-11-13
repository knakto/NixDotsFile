let
  setupBasic = {
    enable = true;
    lsp.enable = true;
  };
in {
  enableExtraDiagnostics = true;
  enableDAP = true;
  enableFormat = true;
  enableTreesitter = true;
  nix.enable = true;
  clang.enable = true;
  bash.enable = true;
  lua.enable = true;
  tailwind.enable = true;
  css.enable = true;
  sql.enable = true;
  ts.enable = true;
  yaml.enable = true;
  rust.enable = true;
  html = {
    enable = true;
    treesitter.autotagHtml = true;
  };
  markdown = {
    enable = true;
    extensions.markview-nvim.enable = true;
  };
  python = {
    enable = true;
    treesitter.enable = true;
  };
}
