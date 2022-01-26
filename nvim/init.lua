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
require("core.telescope")
require("core.treesitter")

vim.cmd([[

  let g:neoformat_python_ufmt = {
  \ 'exe': 'ufmt',
  \ 'args': ['format'],
  \ 'replace': 1,
  \ }

  let g:neoformat_enabled_python = ['ufmt']
  augroup autofmt
    autocmd!
    autocmd BufWritePre * Neoformat
  augroup END

]])
