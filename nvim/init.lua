-- init.lua
-- Author: Niru Maheswaranathan
-- Website: https://github.com/nirum/dotfiles

local status_ok, _ = pcall(require, "impatient")
if not status_ok then
    print("Impatient not installed!")
end

require("core.options")
require("core.mappings")
require("core.plugins")
require("core.colorscheme")
require("core.gitsigns")
require("core.telescope")
require("core.treesitter")
require("core.lsp")
require("core.cmp")
