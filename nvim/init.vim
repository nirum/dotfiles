" init.vim
" Author: Niru Maheswaranathan
" Website: https://github.com/nirum/dotfiles

set termguicolors                   " 24-bit color
runtime ./plug.vim                  " Load plugins
runtime ./settings.lua              " Plugin settings

syntax on                           " Enable syntax highlighting
filetype plugin indent on           " filetype-specific plugins

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
" nnoremap <silent> <space> <cmd>NvimTreeToggle<CR>

" LSP
nnoremap <silent> K :Lspsaga hover_doc<CR>
nnoremap <silent> <C-j> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-k> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
nnoremap <silent> ga :Lspsaga code_action<CR>
nnoremap <silent> ge :Lspsaga show_line_diagnostics<CR>
nnoremap <silent> gh :Lspsaga lsp_finder<CR>
nnoremap <silent> gr :Lspsaga rename<CR>
nnoremap <silent> gs :Lspsaga signature_help<CR>
nnoremap <silent> gd :Lspsaga preview_definition<CR>
nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>

" terminal
nnoremap <silent> <A-d> :Lspsaga open_floaterm<CR>
tnoremap <silent> <A-d> <C-\><C-n>:Lspsaga close_floaterm<CR>

" completion
set completeopt=menuone,noinsert,noselect
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set shortmess+=c

" yapf
let g:neoformat_enabled_python = ['yapf']
augroup autofmt
  autocmd!
  autocmd BufWritePre * Neoformat
augroup END

" indentline
let g:indent_blankline_char = ''
let g:indent_blankline_use_treesitter = v:true
