" Niru Maheswaranathan
" ~/.vimrc file
let os = substitute(system('uname'), "\n", "", "")

" Vim Plugins ------------------------- {{{

call plug#begin('~/.vim/plugged')

" navigation
Plug 'kien/ctrlp.vim'

" colors
Plug 'mkarmona/colorsbox'

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
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" autocomplete
"Plug 'Valloric/YouCompleteMe', {'do': './install.py'}

" python
Plug 'klen/python-mode', { 'for': 'python' }
Plug 'ehamberg/vim-cute-python', { 'for': 'python' }

" haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }

" elm
Plug 'lambdatoast/elm.vim'

" julia
Plug 'JuliaLang/julia-vim'

" emmet for html/css
Plug 'mattn/emmet-vim'

" editor
Plug 'bling/vim-airline'

call plug#end()

" }}}

" Basic Settings ---------------------- {{{

syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins
let mapleader = ";"       " map leader

set ofu=syntaxcomplete#Complete         " omnicomplete
let g:SuperTabDefaultCompletionType = "context"
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
set nohls                               " no highlights on search
set incsearch                           " search as you type
set nobackup                            " no backup files
set nowritebackup                       " only in case you don't want a backup file while editing
set noswapfile                          " no swap files
set autoread                            " auto read when file is changed externally
set number                              " show line numbers
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

" vim-airline (statusline)
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1

function! Modified()
    return &modified ? " +" : ''
endfunction

call airline#parts#define_raw('filename', '%<%f')
call airline#parts#define_function('modified', 'Modified')

let g:airline_section_z = airline#section#create(['hunks', 'branch'])
let g:airline_section_b = airline#section#create_left(['filename'])
let g:airline_section_c = airline#section#create([''])
let g:airline_section_gutter = airline#section#create(['modified', '%='])
let g:airline_section_x = airline#section#create_right([''])
let g:airline_section_y = airline#section#create_right(['%c'])

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

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" map comment commands (NERD Commenter)
map <Leader>mm <Leader>c<space>

" indented line marker color
let g:indentLine_color_gui = '#A7C0CC'

" python-mode (pymode)
let g:pymode_python = 'python'
let g:pymode_doc = 0
let g:pymode_virtualenv = 0
let g:pymode_run = 0
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
let g:pymode_lint_ignore = "E501,W,E231,E265,E261,E262"
let g:pymode_syntax_print_as_function = 1
let g:pymode_lint_todo_symbol = '✎'
let g:pymode_lint_comment_symbol = '☞'
let g:pymode_lint_visual_symbol = 'RR'
let g:pymode_lint_error_symbol = 'XX'
let g:pymode_lint_info_symbol = 'II'
let g:pymode_lint_pyflakes_symbol = 'FF'
let g:pymode_rope = 0
let g:pymode_lint_on_write = 0
map <c-e> :PymodeLint<CR>

" vim-slime
let g:slime_target = "tmux"

" git-gutter
nnoremap <leader>g :GitGutterToggle<CR>
let g:gitgutter_enabled = 0
let g:gitgutter_sign_modified = '❧'
let g:gitgutter_sign_added = '✚'
let g:gitgutter_map_keys = 0

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

    " python-mode jumping
    nmap <c-d> ]]
    nmap <c-u> [[
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

" latex
"let g:tex_flavor = 'latex'

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
iabbrev @@      nirum@stanford.edu
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

" TeX
augroup TeX
    autocmd!
    autocmd FileType tex iabbrev <buffer> alpha   \alpha
    autocmd FileType tex iabbrev <buffer> beta    \beta
    autocmd FileType tex iabbrev <buffer> delta   \delta
    autocmd FileType tex iabbrev <buffer> gamma   \gamma
    autocmd FileType tex iabbrev <buffer> eta     \eta
    autocmd FileType tex iabbrev <buffer> epsilon \epsilon

    " surround with $
    autocmd FileType tex nnoremap 44 i$<Esc>ea$<Esc>
    autocmd FileType tex nnoremap 77 i&<Esc>ea&<Esc>
augroup END

" }}}

" Highlights, colors and themes ---------------------- {{{

" Colorscheme (put this first)
set background=dark

" fonts
if has("gui_gtk2")
    colorscheme ir_black
    set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 14
elseif has("gui_macvim")
    colorscheme colorsbox-steighties
    set guifont=Hack:h14
    let g:Powerline_symbols = 'fancy'
    set lines=80
    set columns=150
endif

" highlight spelling errors
hi clear SpellBad
hi SpellBad guibg=#c62323 term=reverse
noremap <Leader>sp :set spell!<CR>

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

" Emacs-like beginning and end of line.
inoremap <c-e> <c-o>$
inoremap <c-a> <c-o>^

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

" }}}
