" init.vim
" Author: Niru Maheswaranathan
" Website: https://github.com/nirum/dotfiles

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'                                 " easy comments
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'vim-airline/vim-airline'
call plug#end()

syntax on                           " Enable syntax highlighting
filetype plugin indent on           " filetype-specific plugins
nnoremap <SPACE> <nop>
let mapleader = "\<Space>"          " use the spacebar as my leader

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

nnoremap <CR> :noh<CR>
nnoremap <Esc> :noh<Esc>

" colorscheme
set background=dark
colorscheme onehalfdark
let g:airline_theme='onehalfdark'

highlight Comment cterm=italic gui=italic
