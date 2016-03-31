" Niru Maheswaranathan
" ~/.vimrc file

" Vim Plugins ------------------------- {{{

call plug#begin('~/.vim/plugged')

" start-up screen
Plug 'mhinz/vim-startify'

" navigation
Plug 'ctrlpvim/ctrlp.vim'

" the silver searcher (ag)
Plug 'rking/ag.vim'
Plug 'Chun-Yang/vim-action-ag'

" splits (gS) or joins (gJ) multiple lines
Plug 'AndrewRadev/splitjoin.vim'

" colors and themes
Plug 'chriskempson/base16-vim'

" Text object plug-ins motion for function arguments
Plug 'vim-scripts/argtextobj.vim'

" motions for commenting text: g>c, g<c, gc{motion}
Plug 'tomtom/tcomment_vim'

" verb to change or modify surrounding quotes/tags/etc (ys, ds, cs)
Plug 'tpope/vim-surround'

" lets the '.' repeat more commands
Plug 'tpope/vim-repeat'

" git wrapper
Plug 'tpope/vim-fugitive'

" motions for blocks of indented text: [-, [+, [=, ]-, ]+, ]=
Plug 'jeetsukumaran/vim-indentwise'
Plug 'michaeljsmith/vim-indent-object'

" show vertical line indent marks
Plug 'Yggdroot/indentLine'

" better search
Plug 'haya14busa/incsearch.vim'

" git
Plug 'airblade/vim-gitgutter'

" youcompleteme
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

" snippets
Plug 'SirVer/ultisnips'

" syntax checker (syntastic)
Plug 'benekastah/neomake'

" distraction free writing (goyo)
Plug 'junegunn/goyo.vim'

" look up reference material (Dash)
Plug 'keith/investigate.vim'

" LaTeX
Plug 'lervag/vimtex'
Plug 'matze/vim-tex-fold'

" python
Plug 'nirum/vim-cute-python', { 'for': 'python' }

" haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'Twinside/vim-haskellConceal', { 'for': 'haskell' }

" julia
Plug 'JuliaLang/julia-vim'

" javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" editor
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'

call plug#end()

" }}}

" Basic Settings ---------------------- {{{

syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins
let mapleader = ";"       " map leader

set foldmethod=indent                   " sets the fold method to use indentation
set foldlevelstart=5                    " fold automatically
set nocompatible                        " prevents vim from emulating vi's bugs
set smartindent                         " smart indenting on new lines
set expandtab                           " tab inserts spaces in insert mode
set shiftwidth=2                        " tab length with reindent options (columns)
set softtabstop=2                       " tab length (columns)
set encoding=utf-8                      " file encoding
set noerrorbells                        " turn off error bells
set visualbell                          " turn on visual bell
set ruler                               " each window gets status line
set history=1000		                " keep 1000 lines of command line history
set wildmenu                            " tab completion when file browsing
set wildignore+=*.png,*.jpg,*.pdf       " ignore certain files
set incsearch                           " search as you type
set hlsearch                            " turn on search highlighting
set backup                              " backup files
set undofile                            " generates .un file so undo/redo work even after saving
set directory=~/.vim/swp//              " sets the swap directory
set undodir=~/.vim/undo//               " sets the undo directory
set backupdir=~/.vim/backup//           " sets the backup directory
set autoread                            " auto read when file is changed externally
set relativenumber                      " show relative line numbers
set laststatus=2                        " always show the status line
set formatoptions-=or                   " Don't add a comment when I hit enter or o/O on a comment line
set formatoptions+=j                    " remove comment when joining lines
set showcmd		                " display incomplete commands
set gdefault                            " assume the /g flag on :s substitutions
set noesckeys                           " kills function and cursor keys
set iskeyword-=_                        " Use _ as a word-separator
set timeoutlen=500                      " Don't wait so long for the next keypress
set ignorecase                          " ignore case while searching
set smartcase                           " case sensitive if the search text contains a capital letter
set clipboard=unnamed                   " clipboard support in OS X

" }}}

" Plugins ---------------------- {{{

" vim-airline (statusline)
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1

" ultisnips
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["ultisnips"]

" YouCompleteMe
let g:ycm_min_num_of_chars_for_completion = 2

" investigate / Dash
let g:investigate_use_dash = 1
nnoremap K :call investigate#Investigate('n')<CR>
vnoremap K :call investigate#Investigate('n')<CR>

" startify
let g:startify_custom_header = startify#fortune#quote()
let g:startify_change_to_vcs_root = 1
let g:startify_skiplist = ['.git/*']

" ctrl-p (CtrlP)
let g:ctrlp_map = '<c-t>'
let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

" fast grep with ag
set grepprg=ag\ --nogroup\ --nocolor

" incsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" indented line marker color
let g:indentLine_color_gui = '#A7C0CC'

" git-gutter
let g:gitgutter_enabled = 1
let g:gitgutter_sign_modified =  'm'
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_map_keys = 0
let g:gitgutter_eager = 1
let g:gitgutter_realtime = 0

" neomake
autocmd! BufWritePost * Neomake
let g:neomake_warning_sign = {
  \ 'text': 'W',
  \ 'texthl': 'WarningMsg',
  \ }
let g:neomake_error_sign = {
  \ 'text': 'E',
  \ 'texthl': 'ErrorMsg',
  \ }

" latex
let g:tex_flavor='latex'

" }}}

" FileType-specific settings ---------------------- {{{

augroup filetype_vim
  autocmd!
  autocmd FileType vim,zsh setlocal foldmethod=marker
augroup END

augroup filetype_python
  autocmd!
  au BufRead,BufNewFile *.ipy set filetype=python
  autocmd FileType python inoremap # X#
  autocmd FileType python setlocal softtabstop=4
  autocmd FileType python setlocal shiftwidth=4
augroup END

" When loading text files, wrap them and don't split up words
augroup textfiles
  autocmd!
  autocmd BufNewFile,BufRead *.txt setlocal wrap
  autocmd BufNewFile,BufRead *.txt setlocal lbr
augroup END

" }}}

" Abbreviations and Typos ---------------------- {{{

" prose typos
iabbrev adn     and
iabbrev tehn    then
iabbrev waht    what
iabbrev teh     the
iabbrev nriu    niru

" }}}

" Highlights, colors and themes ---------------------- {{{

" Colorscheme (put this first)
set background=dark
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
colorscheme base16-monokai

" fonts
if has("gui_gtk2")
    set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 16
elseif has("gui_macvim")
    set guifont=Hack:h16
endif

" highlight the 80th column
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
autocmd FileType python,js match OverLength /\%81v.\+/

" cursor colors
hi Cursor guifg=cyan guibg=DarkGray
set guicursor=n-c-v:ver100-blinkwait500-blinkon300-blinkoff200-Cursor

" }}}

" Generic Mappings ---------------------- {{{

" circular window navigation
nnoremap <tab>   gt
nnoremap <S-tab> gT

" undo after ctrl-c
inoremap <C-c> <C-c>u

" never go into ex mode
noremap Q :q<CR>

" beginning and end of line
nnoremap <C-h> ^
nnoremap <C-l> $
nnoremap <C-j> j
nnoremap <C-k> k

" clear highlighting
nnoremap <Space> :noh<CR>

" }}}

" Functions ---------------------- {{{

" change directory to the root of the git repository
function! s:root()
  let me = expand('%:p:h')
  let gitd = finddir('.git', me.';')
  if empty(gitd)
    echo "Not in git repo"
  else
    let gitp = fnamemodify(gitd, ':h')
    echo "Change directory to: ".gitp
    execute 'lcd' gitp
  endif
endfunction
command! Root call s:root()

" Toggle conceal level
function! g:ToggleConceal()
    if(&conceallevel)
      setlocal conceallevel=0
    else
      setlocal conceallevel=1
    endif
endfunc
command! Cute call g:ToggleConceal()

" removes trailing whitespace
function! g:RemoveTrailingWhitespace()
    silent! execute ':%s/\s\+$//e'
endfunc
command! Whitespace call g:RemoveTrailingWhitespace()

" }}}
