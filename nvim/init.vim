" init.vim
" Author: Niru Maheswaranathan
" Website: https://github.com/nirum/dotfiles

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'                                 " easy comments
Plug 'tpope/vim-surround'

Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}      " python syntax

Plug 'vim-airline/vim-airline'                              " statusline

Plug 'jremmen/vim-ripgrep'                                  " fast searching
Plug 'stefandtw/quickfix-reflector.vim'                     " bulk edits in quickfix

Plug 'morhetz/gruvbox'                                      " theme

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Plug 'jpalardy/vim-slime'                                   " send to tmux
" Plug 'SirVer/ultisnips'                                     " snippets

" Plug 'dense-analysis/ale'                                   " linting
" Plug 'junegunn/fzf'                                         " fuzzy finder
" Plug 'junegunn/fzf.vim'                                     " fzf bindings
" Plug 'neovim/nvim-lsp'                                      " LSP

call plug#end()

syntax on                           " Enable syntax highlighting
filetype plugin indent on           " filetype-specific plugins
nnoremap <SPACE> <nop>
let mapleader = "\<Space>"          " use the spacebar as my leader

set notermguicolors                 " 24-bit color
set clipboard+=unnamedplus          " use system clipboard
set relativenumber number           " relative line numbers
set gdefault ignorecase smartcase   " smart searching

" tabs and indenting
set tabstop=2 shiftwidth=2 expandtab smartindent
nnoremap <tab> :tabnext<CR>
nnoremap <S-tab> :tabprevious<CR>

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

" colorscheme
set background=dark
colorscheme gruvbox

" airline
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1

" goto build directory
nnoremap gb :execute 'e +/' . escape(escape(expand('%:t'), '.'), '.') . ' %:h/BUILD'<CR>

" italics
highlight Folded guifg=#d8dee9 guibg=#2e3440
highlight Comment cterm=italic gui=italic

" fzf.vim
" nnoremap <silent> f :GFiles<CR>
" nnoremap <silent> t :Buffers<CR>
nnoremap f :Files<CR>
nnoremap s :Rg 
nnoremap t :Buffers<CR>

" vim-slime
" let g:slime_target = "tmux"
" let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}
