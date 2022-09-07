require("tokyonight").setup({
	style = "night",
	styles = {
		comments = "italic",
		keywords = "italic",
		functions = "NONE",
		variables = "NONE",
	},
  lualine_bold = true,
})
vim.cmd([[colorscheme tokyonight-night]])
