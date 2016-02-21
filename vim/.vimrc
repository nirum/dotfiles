" Niru Maheswaranathan
" ~/.vimrc file
let os = substitute(system('uname'), "\n", "", "")

" Vim Plugins ------------------------- {{{

call plug#begin('~/.vim/plugged')

" navigation
Plug 'kien/ctrlp.vim'

" the silver searcher (ag)
Plug 'rking/ag.vim'

" colors
Plug 'mkarmona/colorsbox'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'herrbischoff/cobalt2.vim'

" send code to tmux
Plug 'jpalardy/vim-slime'

" easily comment code
Plug 'scrooloose/nerdcommenter'

" show vertical line indent marks
Plug 'Yggdroot/indentLine'

" copy/paste stack
Plug 'maxbrunsfeld/vim-yankstack'

" better search
Plug 'haya14busa/incsearch.vim'

" git
Plug 'airblade/vim-gitgutter'

" autocompletion (jedi-vim)
Plug 'davidhalter/jedi-vim'

" supertab (more useful behavior for <Tab>)
Plug 'ervandew/supertab'

" snippets
Plug 'SirVer/ultisnips'

" syntax checker (syntastic)
Plug 'scrooloose/syntastic'

" distraction free writing (goyo)
Plug 'junegunn/goyo.vim'

" thesaurus
Plug 'beloglazov/vim-online-thesaurus'

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
Plug 'marijnh/tern_for_vim', { 'for': 'javascript' }

" web
Plug 'othree/html5.vim'
Plug 'othree/yajs.vim'
Plug 'mattn/emmet-vim'
Plug 'leshill/vim-json'

" editor
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'

call plug#end()

" }}}

" Basic Settings ---------------------- {{{

syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins
let mapleader = ";"       " map leader

set ofu=syntaxcomplete#Complete         " omnicomplete
set nocompatible                        " prevents vim from emulating vi's bugs
set autoindent                          " automatic indenting
set smartindent                         " smart indenting
set tabstop=4                           " tab length (columns)
set shiftwidth=4                        " tab length with reindent options (columns)
set expandtab                           " tab inserts spaces in insert mode
set smarttab                            " smart tabs
set et                                  " appropriate tab spacing
set showmatch                           " match brackets
set guioptions-=T                       " turn off gui toolbar
set guioptions-=m                       " turn off gui menu
set noerrorbells                        " turn off error bells
set visualbell                          " turn on visual bell
set ruler                               " each window gets status line
set history=500		                    " keep 500 lines of command line history
set foldlevelstart=5                    " fold automatically
set foldnestmax=10                      " max level of folds
set lazyredraw                          " redraw only when we need to
set wildmenu                            " tab completion when file browsing
set wildignore+=*.png,*.jpg,*.pdf       " ignore certain files
set title                               " set vim title
set hls                                 " highlights on search
set incsearch                           " search as you type
set nobackup                            " no backup files
set nowritebackup                       " only in case you don't want a backup file while editing
set noswapfile                          " no swap files
set autoread                            " auto read when file is changed externally
set nonumber                            " don't show line numbers
set scrolloff=10                        " scroll buffer
set encoding=utf-8                      " file encoding
set cmdheight=1                         " command bar height
set laststatus=2                        " always show the status line
set formatoptions-=or                   " Don't add the comment prefix when I hit enter or o/O on a comment line.
set showcmd		                        " display incomplete commands
set gdefault                            " assume the /g flag on :s substitutions to replace all matches in a line
set undofile                            " generates .un file so undo/redo work even after saving
set ttyfast                             " faster drawing
set noesckeys                           " kills function and cursor keys
set clipboard=unnamed                   " support the Mac OSX clipboard
set iskeyword-=_                        " Use _ as a word-separator
set timeoutlen=500                      " Don't wait so long for the next keypress
set tags=./tags;                        " Set the tag file search order

" backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" ignore case when searching, set default to replace on all lines
set ignorecase
set smartcase
set gdefault

" }}}

" Vimscript file settings ---------------------- {{{

augroup filetype_vim
    autocmd!
    autocmd FileType vim,zsh setlocal foldmethod=marker
augroup END

" editing and sourcing vimrc
noremap <Leader>erc :tabf ~/.vimrc<CR>

" }}}

" Navigation ---------------------- {{{

" uses expression to extract path from current file's path
noremap <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
noremap <Leader>t :tabf <C-R>=expand("%:p:h") . '/'<CR>
noremap <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
noremap <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>
noremap <Leader>q :q<CR>

" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

" }}}

" Plugins ---------------------- {{{

" ultisnips
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" thesaurus
nnoremap <LocalLeader>t :OnlineThesaurusCurrentWord<CR>

" supertab
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" jedi-vim
let g:jedi#popup_select_first = 1
let g:jedi#popup_on_dot = 0

" vim-airline (statusline)
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1

function! Modified()
    return &modified ? " +" : ''
endfunction

call airline#parts#define_raw('filename', '%<%f')
call airline#parts#define_function('modified', 'Modified')

"let g:airline_section_z = airline#section#create(['hunks', 'branch'])
"let g:airline_section_b = airline#section#create_left(['filename'])
"let g:airline_section_c = airline#section#create([''])
"let g:airline_section_gutter = airline#section#create(['modified', '%='])
"let g:airline_section_x = airline#section#create_right([''])
"let g:airline_section_y = airline#section#create_right(['%c'])

let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'v'  : 'V',
  \ 'V'  : 'V-L',
  \ 'c'  : 'C',
  \ '' : 'V-B',
  \ 's'  : 'S',
  \ 'S'  : 'S-L',
  \ '' : 'S-B',
  \ }

" ctrl-p (CtrlP)
" make ctrl-P faster in git repos
let g:ctrlp_map = '<c-t>'
let g:ctrlp_use_caching = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" fast grep with ag
set grepprg=ag\ --nogroup\ --nocolor

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" clear highlights after searching
nnoremap <CR> :nohlsearch<CR>

" map comment commands (NERD Commenter)
map <Leader>mm <Leader>c<space>

" indented line marker color
let g:indentLine_color_gui = '#A7C0CC'

" vim-slime
let g:slime_target = "tmux"

" vimtex
let g:vimtex_fold_enabled=1

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_error_symbol = "!"
let g:syntastic_warning_symbol = "?"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" git-gutter
nnoremap <leader>g :GitGutterToggle<CR>
let g:gitgutter_enabled = 1
let g:gitgutter_sign_modified =  'm'
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_map_keys = 0
let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0

" yankstack
if has("gui_macvim")
	set macmeta
end

" }}}

" FileType-specific settings ---------------------- {{{

augroup filetype_python

    autocmd!
    autocmd FileType python setlocal foldmethod=indent
    autocmd FileType python inoremap # X#

    " syntastic - use python3
    let g:syntastic_python_python_exec = 'python3'
    let g:syntastic_python_checkers=['flake8']
    let g:syntastic_python_flake8_args='--ignore=E501,E225,E731'

augroup END

" When loading text files, wrap them and don't split up words. Automatically
" save new text files.
augroup textfiles
    autocmd!
    autocmd BufNewFile,BufRead *.txt setlocal wrap
    autocmd BufNewFile,BufRead *.txt setlocal lbr
    autocmd BufNewFile *.txt write
    autocmd BufNewFile *.md  write
    autocmd BufNewFile *.mkd write
augroup END

" fix comment auto-indenting for different languages
augroup matlab
    autocmd FileType matlab inoremap % X%
augroup END

augroup web
    autocmd!

    " for CSS, also have things in braces indented:
		autocmd FileType css set smartindent

    " for HTML, generally format text, but if a long line has been created
    " leave it alone when editing:
		autocmd FileType html set formatoptions+=tl

    " for both CSS and HTML, use genuine tab characters for
    " indentation, to make files a few bytes smaller:
		autocmd FileType html,css set noexpandtab tabstop=2

    " don't wrap html
		autocmd BufWritePre,BufRead *.html setlocal nowrap

    " format XML files
		autocmd FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

		let g:user_emmet_install_global = 0
		autocmd FileType html,css EmmetInstall

augroup END

" }}}

" Utilities ---------------------- {{{

" add semicolon to the end of the line
nnoremap  <Leader>j; <Esc>$a;<Esc>j;;
inoremap  <Leader>j; <Esc>$a;<Esc>j;;

" $ and 0 work with shift
nnoremap 4 $
nnoremap ) 0

" }}}

" Save/Copy/Paste ---------------------- {{{

" to save
noremap <space> :w<CR>
nnoremap <Leader>w :w<CR>
inoremap <Leader>w <ESC>:w<CR>

" pasting
nmap <c-p> <Plug>yankstack_substitute_older_paste

" }}}

" Abbreviations and Typos ---------------------- {{{

" prose typos
iabbrev adn     and
iabbrev tehn    then
iabbrev waht    what
iabbrev teh     the
iabbrev nriu    niru

" command typos
if has("user_commands")
    command! -bang -nargs=? -complete=file E e<bang> <args>
    command! -bang -nargs=? -complete=file W w<bang> <args>
    command! -bang -nargs=? -complete=file Wq wq<bang> <args>
    command! -bang -nargs=? -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif

" }}}

" Highlights, colors and themes ---------------------- {{{

" Colorscheme (put this first)
set background=dark
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" fonts
if has("gui_gtk2")
    colorscheme ir_black
    set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 16
elseif has("gui_macvim")
    colorscheme base16-monokai
    set guifont=Hack:h16
    let g:Powerline_symbols = 'fancy'
    set lines=80
    set columns=150
else
    colorscheme base16-monokai
endif

" highlight the 80th column
set colorcolumn=80
hi ColorColumn guibg=#2b3948

" cursor colors
hi Cursor guifg=cyan guibg=DarkGray
set guicursor=n-c-v:ver100-blinkwait500-blinkon300-blinkoff200-Cursor

" }}}

" Generic Mappings ---------------------- {{{

" circular window navigation
nnoremap <tab>   gt
nnoremap <S-tab> gT

" move lines
nnoremap <silent> <C-j> :move+<cr>
nnoremap <silent> <C-k> :move-2<cr>
vnoremap <silent> <C-j> :move '>+1<cr>gv=gv
vnoremap <silent> <C-k> :move '<-2<cr>gv=gv

" indent lines
nnoremap <silent> <C-l> >>
nnoremap <silent> <C-h> <<
vnoremap <silent> <C-l> >gv
vnoremap <silent> <C-h> <gv

" undo after ctrl-c
inoremap <C-c> <C-c>u

" folding
nnoremap f za
nnoremap F zM

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
