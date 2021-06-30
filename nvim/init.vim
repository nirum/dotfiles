" init.vim
" Author: Niru Maheswaranathan
" Website: https://github.com/nirum/dotfiles

runtime ./plug.vim                  " Load plugins
runtime ./settings.lua              " Plugin settings

syntax on                           " Enable syntax highlighting
filetype plugin indent on           " filetype-specific plugins

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
" colorscheme nord
set signcolumn=yes:1

" telescope.nvim
nnoremap <silent> f <cmd>Telescope find_files<CR>
nnoremap <silent> s <cmd>Telescope live_grep<CR>
" nnoremap <silent> t :Tags<CR>
" nnoremap <silent> <space> :Buffers<CR>
" let g:fzf_layout = { 'up': '~60%' }

let g:indentLine_char = '│'

" LSP
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

" completion
set completeopt=menuone,noinsert,noselect
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set shortmess+=c

highlight Comment cterm=italic
set t_ZH=[3m
set t_ZR=23m
