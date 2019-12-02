" init.vim
" Author: Niru Maheswaranathan
" Website: https://github.com/nirum/dotfiles

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'                                 " easy comments
Plug 'arcticicestudio/nord-vim'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'vim-airline/vim-airline'
Plug 'neovim/nvim-lsp'
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

set splitright
set splitbelow

nnoremap <CR> :noh<CR>
nnoremap <Esc> :noh<Esc>

" colorscheme
set background=dark
colorscheme nord
let g:airline_theme='nord'

let lsp_settings = {
          \   "pyls" : {
          \     "enable" : v:true,
          \     "trace" : { "server" : "verbose", },
          \     "commandPath" : "",
          \     "configurationSources" : [ "pycodestyle" ],
          \     "plugins" : {
          \       "jedi_completion" : { "enabled" : v:true, },
          \       "jedi_hover" : { "enabled" : v:true, },
          \       "jedi_references" : { "enabled" : v:true, },
          \       "jedi_signature_help" : { "enabled" : v:true, },
          \       "jedi_symbols" : {
          \         "enabled" : v:true,
          \         "all_scopes" : v:true,
          \       },
          \       "mccabe" : {
          \         "enabled" : v:true,
          \         "threshold" : 15,
          \       },
          \       "preload" : { "enabled" : v:true, },
          \       "pycodestyle" : { "enabled" : v:true, },
          \       "pydocstyle" : {
          \         "enabled" : v:false,
          \         "match" : "(?!test_).*\\.py",
          \         "matchDir" : "[^\\.].*",
          \       },
          \       "pyflakes" : { "enabled" : v:true, },
          \       "rope_completion" : { "enabled" : v:true, },
          \       "yapf" : { "enabled" : v:true, },
          \     }}}
call nvim_lsp#setup("pyls", lsp_settings)

" disable preview window
"set completeopt-=preview

" use omni completion provided by lsp
set omnifunc=lsp#omnifunc

nnoremap <silent> :dc :call lsp#text_document_declaration()<CR>
nnoremap <silent> :df :call lsp#text_document_definition()<CR>
nnoremap <silent> :h  :call lsp#text_document_hover()<CR>
nnoremap <silent> :i  :call lsp#text_document_implementation()<CR>
nnoremap <silent> :s  :call lsp#text_document_signature_help()<CR>
nnoremap <silent> :td :call lsp#text_document_type_definition()<CR>

highlight Comment cterm=italic gui=italic
