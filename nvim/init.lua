-- init.lua
-- Author: Niru Maheswaranathan
-- Website: https://github.com/nirum/dotfiles

require("config.options")
require("config.mappings")
require("config.interface")

-- Plugins
vim.pack.add({"https://github.com/webhooked/kanso.nvim"})
vim.pack.add({"https://github.com/stevearc/oil.nvim"})
vim.pack.add({"https://github.com/sphamba/smear-cursor.nvim"})
vim.pack.add({"https://github.com/lewis6991/gitsigns.nvim"})

require("config.lsp")

vim.cmd("colorscheme kanso")
