local status_ok, tokyonight = pcall(require, "tokyonight")
if not status_ok then
  return
end

tokyonight.setup({
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

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

lualine.setup({
	options = {
		theme = "tokyonight",
	},
})
