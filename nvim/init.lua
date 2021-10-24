vim.o.termguicolors = true
vim.cmd([[
  runtime ./plug.vim
  runtime ./settings.lua
]])
-- require 'settings.lua'

vim.cmd([[
  set clipboard+=unnamedplus
  set relativenumber number
  set gdefault ignorecase smartcase
  set splitright
  set splitbelow
  set foldlevelstart=99
  set signcolumn=yes

  set tabstop=2 shiftwidth=2 expandtab smartindent

  set undofile
  set undodir=~/.vim-undo

  nnoremap ; :
  nnoremap : ;

  nnoremap <CR> :noh<CR>
  nnoremap <Esc> :noh<Esc>
  nnoremap <tab> :next<CR>
  nnoremap <S-tab> :previous<CR>

  vnoremap < <gv
  vnoremap > >gv

  nnoremap <silent> f <cmd>Telescope find_files<CR>
  nnoremap <silent> s <cmd>Telescope live_grep<CR>

  let g:neoformat_enabled_python = ['yapf']
  augroup autofmt
    autocmd!
    autocmd BufWritePre * Neoformat
  augroup END

  let g:indent_blankline_char = ''
  let g:indent_blankline_use_treesitter = v:true
]])
