-- init.lua
-- Author: Niru Maheswaranathan
-- Website: https://github.com/nirum/dotfiles

-- hotpot


local opt = require("config.options")  -- lua
opt("fennel")

-- require("options")  -- fnl



require("config.mappings")
require("config.interface")
-- require("config.plugins")
require("config.lsp")

-- vim.cmd([[colorscheme kanso]])
