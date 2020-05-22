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
Plug 'SirVer/ultisnips'

call plug#end()

syntax on                           " Enable syntax highlighting
filetype plugin indent on           " filetype-specific plugins
nnoremap <SPACE> <nop>
let mapleader = "\<Space>"          " use the spacebar as my leader

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

" colorscheme (gruvbox)
set background=dark
let g:gruvbox_italic=1
let g:gruvbox_sign_column='bg0'
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
set signcolumn=yes:1

" statusline
set statusline=%#GruvboxYellowSign#       " Yellow font color.
set statusline+=%{&modified?'✘':'✔'}      " Has the file been modified?
set statusline+=\                         " Space.
set statusline+=%#GruvboxBlueSign#        " Italics.
set statusline+=\ %f\ %r                  " Path to the file
set statusline+=%=                        " Switch to the right side
set statusline+=%#GruvboxYellowSign#      " Blue font color.
set statusline+=ⅽ\ %c\ ℓ\ %l/%L\ %y\      " Current column and row (ℓ = \u2113, ⅽ = \u217d).

" fzf.vim
nnoremap <silent> f :Files<CR>
nnoremap <silent> s :Rg 
nnoremap <silent> t :Buffers<CR>
let g:fzf_layout = { 'up': '~50%' }

" vim-slime
" let g:slime_target = "tmux"
" let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}
"

" LSP
lua << EOF
local nvim_lsp = require'nvim_lsp'
nvim_lsp.texlab.setup{}
nvim_lsp.ccls.setup{}
EOF
" nvim_lsp.pyls.setup{}
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
" ultisnips
let g:UltiSnipsExpandTrigger="<C-e>"
inoremap <expr><Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
" set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
" let g:completion_enable_snippet = 'UltiSnips'
let g:deoplete#enable_at_startup = 1

set updatetime=100
set shortmess+=c

" signify
let g:signify_sign_add = '●'
" let g:signify_sign_delete = '●'
" let g:signify_sign_delete_first_line = '●'
" let g:signify_sign_change = '●'

" highlight SignifySignAdd    guifg=#00ff00 guibg=NONE
" highlight SignifySignDelete guifg=#ff0000 guibg=NONE
" highlight SignifySignChange guifg=#ffff00 guibg=NONE
" highlight Folded guifg=#d8dee9 guibg=#2e3440

" Vista
" let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'nvim-lsp'
" let g:vista_fzf_preview = ['right:50%']
" let g:vista#renderer#enable_icon = 1
" let g:vista#renderer#icons = {
" \   "function": "\uf794",
" \   "variable": "\uf71b",
" \  }

" system specific configuration
let localconfig = expand("~/.local_config.vim")
if filereadable(localconfig)
  execute 'source' localconfig
endif
