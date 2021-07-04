" init.vim
" Author: Niru Maheswaranathan
" Website: https://github.com/nirum/dotfiles

runtime ./plug.vim                  " Load plugins
runtime ./settings.lua              " Plugin settings

syntax on                           " Enable syntax highlighting
filetype plugin indent on           " filetype-specific plugins

set termguicolors                   " 24-bit color
set clipboard+=unnamedplus          " use system clipboard
set norelativenumber nonumber       " relative line numbers
set gdefault ignorecase smartcase   " smart searching
set splitright
set splitbelow
set foldlevelstart=99
set signcolumn=yes

" tabs and indenting
set tabstop=2 shiftwidth=2 expandtab smartindent

" persistent undo
set undofile
set undodir=~/.vim-undo

" reduce having to type shift for commands
nnoremap ; :
nnoremap : ;

" mappings
nnoremap <CR> :noh<CR>
nnoremap <Esc> :noh<Esc>
nnoremap <tab> :bnext<CR>
nnoremap <S-tab> :bprevious<CR>
nnoremap <c-t> :enew<CR>
vnoremap < <gv
vnoremap > >gv
nnoremap <silent> f <cmd>Telescope find_files<CR>
nnoremap <silent> s <cmd>Telescope live_grep<CR>
nnoremap <silent> <space> <cmd>NvimTreeToggle<CR>

" LSP
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

" completion
set completeopt=menuone,noinsert,noselect
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set shortmess+=c

" indentline
let g:indent_blankline_char = ''
let g:indent_blankline_use_treesitter = v:true
