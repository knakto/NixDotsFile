{config, pkgs, ...}:{
	package = pkgs.vimPlugins.lualine-nvim;
	setup = builtins.readFile ./lualine.lua;
}
