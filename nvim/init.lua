-- init.lua
-- Author: Niru Maheswaranathan
-- Website: https://github.com/nirum/dotfiles

require("config.options")
require("config.mappings")
require("config.interface")
require("config.plugins")

vim.cmd([[colorscheme tokyonight]])

-- vim.api.nvim_create_autocmd("BufEnter", {
--   callback = function()
--     vim.lsp.start({
--       name = "clangd",
--       cmd = {"clangd",},
--       root_dir = vim.fn.getcwd(),
--     })
--   end,
-- })
--
