" init.vim
" Author: Niru Maheswaranathan
" Website: https://github.com/nirum/dotfiles

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'                                 " easy comments
Plug 'tpope/vim-surround'

Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}      " python syntax

" Plug 'jremmen/vim-ripgrep'                                  " fast searching
" Plug 'stefandtw/quickfix-reflector.vim'                     " bulk edits in quickfix

Plug 'morhetz/gruvbox'                                      " theme

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-lsp'

" Plug 'SirVer/ultisnips'                                     " snippets

" Plug 'dense-analysis/ale'                                   " linting
Plug 'junegunn/fzf'                                         " fuzzy finder
Plug 'junegunn/fzf.vim'                                     " fzf bindings
Plug 'neovim/nvim-lsp'                                      " LSP
Plug 'liuchengxu/vista.vim'
" Plug 'haorenW1025/completion-nvim'

Plug 'mhinz/vim-signify'

call plug#end()

syntax on                           " Enable syntax highlighting
filetype plugin indent on           " filetype-specific plugins
nnoremap <SPACE> <nop>
let mapleader = "\<Space>"          " use the spacebar as my leader

command! Edit edit $MYVIMRC
command! Src source $MYVIMRC

set termguicolors                 " 24-bit color
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

" statusline
set statusline=%#GruvboxYellow#           " Yellow font color.
set statusline+=%{repeat('\ ',1)}         " Space.
set statusline+=%{&modified?'✘':'✔'}      " Has the file been modified?
set statusline+=\                         " Space.
set statusline+=%#Comment#                " Italics.
set statusline+=\ %f\ %r                  " Path to the file
set statusline+=%=                        " Switch to the right side
set statusline+=%1*                       " Switch to User1 highlight group (italics).
set statusline+=%#GruvboxBlue#            " Blue font color.
set statusline+=ⅽ\ %c\ ℓ\ %l/%L\ %y\      " Current column and row (ℓ = \u2113, ⅽ = \u217d).

" italics
highlight Folded guifg=#d8dee9 guibg=#2e3440
highlight Comment cterm=italic gui=italic

" fzf.vim
nnoremap <silent> f :GFiles<CR>
nnoremap <silent> s :Rg 
nnoremap <silent> t :Buffers<CR>

" vim-slime
" let g:slime_target = "tmux"
" let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}
"

" LSP
lua << EOF
local nvim_lsp = require'nvim_lsp'
nvim_lsp.pyls.setup{}
nvim_lsp.texlab.setup{}
nvim_lsp.ccls.setup{}
EOF
" root_dir = nvim_lsp.util.root_pattern('.git');

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

" Use completion-nvim in every buffer
" autocmd BufEnter * lua require'completion'.on_attach()

" Use <Tab> and <S-Tab> to navigate through popup menu
" let g:UltiSnipsExpandTrigger='<C-j>'
inoremap <expr><Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
" set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
" let g:completion_enable_snippet = 'UltiSnips'
let g:deoplete#enable_at_startup = 1

set updatetime=100
set shortmess+=c

" Vista
" let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'nvim-lsp'
" let g:vista_fzf_preview = ['right:50%']
" let g:vista#renderer#enable_icon = 1
" let g:vista#renderer#icons = {
" \   "function": "\uf794",
" \   "variable": "\uf71b",
" \  }
