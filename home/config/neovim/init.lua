vim.g.mapleader = " "

function setTheme()
	require("oxocarbon").setup({})

	vim.cmd("colorscheme oxocarbon")
end

function header42()
	require("42header").setup({
		default_map = true,
		auto_update = false,
		user = "knakto",
		mail = "knakto@student.42bangkok.com",
	})
end
