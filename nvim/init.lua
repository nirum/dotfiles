-- init.lua
-- Author: Niru Maheswaranathan
-- Website: https://github.com/nirum/dotfiles

require("impatient")
require("core.options")
require("core.mappings")
require("core.plugins")
require("core.colorscheme")
require("core.cmp")
require("core.lsp")
require("core.statusline")
require("core.telescope")
require("core.treesitter")
vim.notify = require("notify")
