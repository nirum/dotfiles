-- init.lua
-- Author: Niru Maheswaranathan
-- Website: https://github.com/nirum/dotfiles

local status_ok, _ = pcall(require, "impatient")
if not status_ok then
    print("Impatient not installed!")
end

require("options")
require("mappings")
require("plugins")
require("colorscheme")
require("gitsigns")
require("telescope")
require("treesitter")
require("lsp")
require("cmp")
