-- init.lua
-- Author: Niru Maheswaranathan
-- Website: https://github.com/nirum/dotfiles

if vim.loader then
  vim.loader.enable()
end

require("core")
vim.cmd([[colorscheme tokyonight]])
