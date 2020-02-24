" init.vim
" Author: Niru Maheswaranathan
" Website: https://github.com/nirum/dotfiles

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'                                 " easy comments
Plug 'tpope/vim-surround'
Plug 'arcticicestudio/nord-vim'                             " theme
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}      " python syntax
Plug 'vim-airline/vim-airline'                              " statusline
call plug#end()

let g:python3_host_prog = '/Users/nirum/anaconda3/bin/python3'
let g:loaded_python_provider = 0

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

set splitright
set splitbelow

nnoremap <CR> :noh<CR>
nnoremap <Esc> :noh<Esc>

" colorscheme
set background=dark
colorscheme nord

" nord
let g:nord_uniform_diff_background = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1

" airline
let g:airline_theme='nord'
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1

highlight Folded guifg=#d8dee9 guibg=#2e3440
highlight Comment cterm=italic gui=italic
