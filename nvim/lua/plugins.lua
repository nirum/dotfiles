local add = vim.pack.add
add({"https://github.com/webhooked/kanso.nvim"})
require("kanso").setup({compile = true, transparent = true})
vim.cmd("colorscheme kanso")
return nil
