" init.vim
" Author: Niru Maheswaranathan
" Website: https://github.com/nirum/dotfiles

call plug#begin('~/.vim/plugged')

" Utilities
Plug 'tpope/vim-commentary'                                 " easy comments
Plug 'tpope/vim-surround'                                   " quotes/parens/brackets/etc
Plug 'AndrewRadev/splitjoin.vim'                            " gS and gJ
Plug 'Yggdroot/indentLine'                                  " Indentation lines

" LSP
Plug 'neovim/nvim-lspconfig'                                " LSP

" Completion
Plug 'hrsh7th/nvim-compe'                                   " Completion Engine

" Style
Plug 'arcticicestudio/nord-vim'                             " Theme
Plug 'vim-airline/vim-airline'

" Search
Plug 'junegunn/fzf'                                         " fuzzy finder
Plug 'junegunn/fzf.vim'                                     " fzf bindings

call plug#end()

syntax on                           " Enable syntax highlighting
filetype plugin indent on           " filetype-specific plugins

" Edit this file.
command! Erc edit $MYVIMRC
command! Trc tabf $MYVIMRC
command! Src source $MYVIMRC
command! Hi source $VIMRUNTIME/syntax/hitest.vim

set termguicolors                   " 24-bit color
set clipboard+=unnamedplus          " use system clipboard
set relativenumber number           " relative line numbers
set gdefault ignorecase smartcase   " smart searching

" tabs and indenting
set tabstop=2 shiftwidth=2 expandtab smartindent

" persistent undo
set undofile
set undodir=~/.vim-undo

" reduce having to type shift for commands
nnoremap ; :
nnoremap : ;

set splitright
set splitbelow

nnoremap <CR> :noh<CR>
nnoremap <Esc> :noh<Esc>
set foldlevelstart=99
nnoremap <tab> gt
nnoremap s-<tab> gT
" nnoremap <tab> :tabnext<CR>
" nnoremap <S-tab> :tabprevious<CR>

" colorscheme
colorscheme nord
set signcolumn=yes:1

" fzf.vim
nnoremap <silent> f :Files<CR>
nnoremap <silent> s :Rg<CR>
nnoremap <silent> t :Tags<CR>
nnoremap <silent> <space> :Buffers<CR>
let g:fzf_layout = { 'up': '~60%' }

let g:indentLine_char = '│'

" LSP
lua << EOF
local nvim_lsp = require'lspconfig'
nvim_lsp.pyright.setup{}

vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = false;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
    treesitter = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

" set updatetime=100
set shortmess+=c
