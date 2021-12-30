-- init.lua
-- Author: Niru Maheswaranathan
-- Website: https://github.com/nirum/dotfiles

require('core.options')
require('core.mappings')
require('core.plugins')
require('core.colorscheme')
require('core.cmp')
require('core.lsp')
require('core.telescope')
require('core.treesitter')
-- require('core.gitsigns')

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
  -- nnoremap <silent> f <cmd>Telescope find_files<CR>
  -- nnoremap <silent> s <cmd>Telescope live_grep<CR>
--   let g:indent_blankline_char = ''
--   let g:indent_blankline_use_treesitter = v:true
