-- init.lua
-- Author: Niru Maheswaranathan
-- Website: https://github.com/nirum/dotfiles

require("impatient")
require("core.options")
require("core.mappings")
require("core.plugins")
require("core.colorscheme")
require("core.cmp")
require("core.debug")
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

  function! s:PyPreSave()
    execute "echo('foo')"
  endfunction

  function! s:PyPostSave()
    execute "silent !tidy-imports --black --quiet --replace-star-imports --action REPLACE " . bufname("%")
    execute "e"
  endfunction

  :command! PyPreSave :call s:PyPreSave()
  :command! PyPostSave :call s:PyPostSave()

  augroup pyflyby
    autocmd!
    autocmd bufwritepre *.py execute 'PyPreSave'
    autocmd bufwritepost *.py execute 'PyPostSave'
  augroup end

]])
