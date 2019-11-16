" init.vim
" Author: Niru Maheswaranathan
" Website: https://github.com/nirum/dotfiles

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'sh install.sh'}
" Plug 'ncm2/ncm2'
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-ultisnips'
" Plug 'roxma/nvim-yarp'
" Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'mhinz/vim-signify'                                    " vcs gutter
Plug 'kana/vim-textobj-user'                                " custom text objects
Plug 'bps/vim-textobj-python'                               " python text objects
Plug 'tpope/vim-commentary'                                 " easy comments
" Plug 'mattn/emmet-vim'                                      " HTML convenince
"Plug 'owickstrom/vim-colors-paramount'
"Plug 'hauleth/blame.vim'
" Plug 'seesleestak/duo-mini'
Plug 'AlessandroYorba/Sierra'
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

" circular window navigation
"nnoremap <tab>   :bNext<cr>
"nnoremap <S-tab> :bprevious<cr>

" reduce having to type shift for commands
nnoremap ; :
nnoremap : ;

nnoremap <CR> :noh<CR>
nnoremap <Esc> :noh<Esc>

" colorscheme
set background=dark
let g:sierra_Midnight=1
colorscheme sierra

" fzf
nnoremap f :Files<CR>
nnoremap t :Buffers<CR>
nnoremap s :Ag<CR>

" language server
let g:LanguageClient_serverCommands = {
      \ 'python': ['pyls'],
      \ }

" autocompletion (ncm2)
" autocmd BufEnter * call ncm2#enable_for_buffer()
" set completeopt=noinsert,menuone,noselect
" inoremap <expr> <c-j> pumvisible() ? "\<c-j>" : "\<c-j>"
" inoremap <expr> <c-k> pumvisible() ? "\<c-k>" : "\<c-k>"
" inoremap <expr> <buffer> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="horizontal"
"let g:UltiSnipsSnippetDirectories=["snippets"]
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/snippets']

" language server
" let g:LanguageClient_autoStart = 1
" nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
"nnoremap <silent> K :call <SID>show_documentation()<CR>

" ale
" let g:ale_sign_error='✘'
" let g:ale_sign_warning='⚑'
" let g:ale_lint_on_insert_leave = 0
" let g:ale_lint_on_text_changed = 0
" let g:ale_lint_on_enter = 0
" let g:ale_lint_on_save = 1
" nnoremap <c-j> :ALENext<cr>
" nnoremap <c-k> :ALEPrevious<cr>

" emmet html
let g:user_emmet_leader_key=','
