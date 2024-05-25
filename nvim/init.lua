-- init.lua
-- Author: Niru Maheswaranathan
-- Website: https://github.com/nirum/dotfiles

-- vim.cmd([[let g:python3_host_prog="/usr/bin/python3"]])
-- vim.cmd([[let g:python_host_prog="/usr/bin/python2"]])

require("config.options")
require("config.mappings")
require("config.plugins")

vim.cmd([[colorscheme tokyonight]])
