"         _
"  __   _(_)_ __ ___  _ __ ___
"  \ \ / / | '_ ` _ \| '__/ __|
"   \ V /| | | | | | | | | (__
"    \_/ |_|_| |_| |_|_|  \___|
"
" Author: Niru Maheswaranathan
" Website: https://github.com/nirum/dotfiles

" Plugins ------------------------- {{{

call plug#begin('~/.vim/plugged')

" incsearch
Plug 'haya14busa/incsearch.vim'

" tags
Plug 'fntlnz/atags.vim'
Plug 'majutsushi/tagbar'

" quickscope (underline matches for f/t/F/T navigation)
Plug 'unblevable/quick-scope'

" editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'

" system copy/paste with cp
Plug 'christoomey/vim-system-copy'

" comments
Plug 'tomtom/tcomment_vim'

" custom text objects (nouns)
Plug 'kana/vim-textobj-user'
Plug 'bps/vim-textobj-python'
Plug 'thinca/vim-textobj-function-javascript'

" python
Plug 'nirum/vim-cute-python', { 'for': 'python' }

" haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'Twinside/vim-haskellConceal', { 'for': 'haskell' }

" vim-airline (statusline)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" base16 colorschemes
Plug 'chriskempson/base16-vim'

" gui-goodness
Plug 'ryanoasis/vim-devicons'
Plug 'chrisbra/unicode.vim'

" show vertical line indent marks
Plug 'Yggdroot/indentLine'

call plug#end()

" }}}

" Basic Settings ---------------------- {{{
syntax on                               " Enable syntax highlighting
filetype plugin indent on               " Enable filetype-specific indenting and plugins
nnoremap <SPACE> <nop>
let mapleader = "\<Space>"              " use the spacebar as my leader

" 24-bit color!
if has('termguicolors')
  set termguicolors
endif

" use indentation for folding
set foldmethod=indent
set foldlevelstart=1

" tabs and indenting
set tabstop=2 shiftwidth=2 expandtab smartindent

" backup and swap files
set backup undofile
set directory=~/.vim-swp// undodir=~/.vim-undo// backupdir=~/.vim-backup//

" show relative line numbers + the absolute number for the current line
set relativenumber number

" editing
set noesckeys timeoutlen=500

" searching
set gdefault ignorecase smartcase

" don't update the screen during macros
set lazyredraw

" cmdheight >= 2 for echodoc support
" set cmdheight=2

" smooth sidescrolling
set sidescroll=1

" clipboard support in OS X
set clipboard=unnamed

" }}}

" Plugin settings ----------------------- {{{

" incsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" quickscope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" airline preferences
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_theme='base16'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" indentline
let g:indentLine_color_gui = '#4F5B66'
let g:indentLine_char = '┊'

" }}}

" Generic Mappings ---------------------- {{{

" I need to come up with a better mapping for Q ...
nnoremap Q <nop>

" circular window navigation
nnoremap <tab>   gt
nnoremap <S-tab> gT

" undo after ctrl-c
inoremap <c-c> <c-c>u

" exit insert, dd line, enter insert
inoremap <c-d> <esc>ddi

" clear highlighting
nnoremap <Esc> :noh<CR>

" reduce having to type shift for commands
nnoremap ; :
nnoremap : ;

" swap " and ' for easier registers
nnoremap " '
nnoremap ' "

" yank without jank
vnoremap <expr>y "my\"" . v:register . "y`y"

" insert an underline below the current line
inoremap <C-u> <CR><Esc>kyyp^v$r-o

" }}}

" Leader commands -------------- {{{

" clear whitespace
nnoremap <leader>w :Wsp<CR>

" edit and source $MYVIMRC
nnoremap <leader>erc :tabf $MYVIMRC<CR>
nnoremap <leader>src :source $MYVIMRC<CR>

" undo
nnoremap <leader>u :GundoToggle<CR>

" Folding
nnoremap <leader>a za
nnoremap <leader>A zA
nnoremap <leader>o zo
nnoremap <leader>O zO
" nnoremap <leader>c zc
" nnoremap <leader>C zC
" nnoremap <leader>m zM
" nnoremap <leader>M zM

" commenting
nmap <leader>c gcc

" }}}

" FileType-specific settings ---------------------- {{{

augroup filetype_vim
  autocmd!
  autocmd FileType vim,zsh setlocal foldmethod=marker
  autocmd BufWritePost .vimrc so $MYVIMRC
augroup END

augroup filetype_python
  autocmd!
  autocmd BufRead,BufNewFile *.ipy set filetype=python
  autocmd FileType python inoremap # X#
  autocmd FileType python setlocal softtabstop=4
  autocmd FileType python setlocal tabstop=4
  autocmd FileType python setlocal shiftwidth=4
augroup END

" When loading text files, wrap them and don't split up words
augroup textfiles
  autocmd!
  autocmd BufNewFile,BufRead *.txt setlocal wrap
  autocmd BufNewFile,BufRead *.txt setlocal lbr

  " set spelling (need to fix this)
  " autocmd BufRead,BufNewFile *.md setlocal spell complete+=kspell
  " autocmd BufRead,BufNewFile *.md hi SpellBad guibg=#ff2929 guifg=#ffffff" ctermbg=224
augroup END

" }}}

" Abbreviations and Typos ---------------------- {{{

" prose typos
iabbrev adn     and
iabbrev tehn    then
iabbrev waht    what
iabbrev teh     the
iabbrev nriu    niru
iabbrev rnage   range

" }}}

" Highlights, colors and themes ---------------------- {{{

" colorscheme
set background=dark
colorscheme base16-ocean
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete:h16

" highlight past the 80th column
highlight OverLength ctermbg=red ctermfg=white guibg=#A97070
augroup highlighting
  autocmd!
  autocmd FileType python,js match OverLength /\%81v.\+/
augroup END

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
    let l = line(".")
    let c = col(".")
    silent! execute ':%s/\s\+$//e'
    call cursor(l, c)
endfunc
command! Wsp call g:RemoveTrailingWhitespace()

" update vim-plug
command! PU PlugUpdate | PlugUpgrade

" }}}
