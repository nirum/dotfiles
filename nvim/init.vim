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

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" the silver searcher (ag) and a gag verb
Plug 'rking/ag.vim'
Plug 'Chun-Yang/vim-action-ag'

" documentation
Plug 'keith/investigate.vim'

" git and GitHub
Plug 'tpope/vim-fugitive'
Plug 'rhysd/github-complete.vim'
Plug 'airblade/vim-gitgutter'

" incsearch
Plug 'haya14busa/incsearch.vim'

" tags
Plug 'fntlnz/atags.vim'
Plug 'majutsushi/tagbar'

" autocompletion
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi'

" snippets
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" syntax checker (neomake)
Plug 'benekastah/neomake'

" quickscope (underline matches for f/t/F/T navigation)
Plug 'unblevable/quick-scope'

" editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'

" comments
Plug 'tomtom/tcomment_vim'

" distraction free writing (goyo)
Plug 'junegunn/goyo.vim'

" custom text objects (nouns)
Plug 'kana/vim-textobj-user'
Plug 'bps/vim-textobj-python'

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'wellle/tmux-complete.vim'
Plug 'epeli/slimux'

" python
Plug 'nirum/vim-cute-python', { 'for': 'python' }

" haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'Twinside/vim-haskellConceal', { 'for': 'haskell' }

" julia
Plug 'JuliaLang/julia-vim'

" LaTeX
" Plug 'lervag/vimtex'
" Plug 'matze/vim-tex-fold'
" let g:tex_flavor='latex'

" javascript
" Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" Plug 'mxw/vim-jsx'

" web
Plug 'valloric/MatchTagAlways', {'for': 'html'}
Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim', {'for': 'html'}

" other
" Plug 'elzr/vim-json', {'on_ft': 'json'}
" Plug 'tpope/vim-markdown', {'on_ft': 'markdown'}

" vim-airline (statusline)
Plug 'vim-airline/vim-airline'

" start screen
Plug 'mhinz/vim-startify'

" colorschemes
Plug 'mhartington/oceanic-next'

" gui-goodness
Plug 'ryanoasis/vim-devicons'

" show vertical line indent marks
Plug 'Yggdroot/indentLine'

" weakness
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

call plug#end()

" }}}

" Basic Settings ---------------------- {{{
syntax on                               " Enable syntax highlighting
filetype plugin indent on               " Enable filetype-specific indenting and plugins
nnoremap <SPACE> <nop>
let mapleader = "\<Space>"              " use the spacebar as my leader
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" use indentation for folding
set foldmethod=indent foldlevelstart=5

" tabs and indenting
set tabstop=2 shiftwidth=2 expandtab smartindent

" backup and swap files
set backup undofile
set directory=~/.vim-swp// undodir=~/.vim-undo// backupdir=~/.vim-backup//

" show relative line numbers + the absolute number for the current line
set relativenumber number

" editing
set noesckeys timeoutlen=500
" set iskeyword-=_

" searching
set gdefault ignorecase smartcase

" don't update the screen during macros
set lazyredraw

" clipboard support in OS X
set clipboard=unnamed

" }}}

" Plugin settings ----------------------- {{{

" FZF
fun! s:fzf_root()
  let path = finddir(".git", expand("%:p:h").";")
  return fnamemodify(substitute(path, ".git", "", ""), ":p:h")
endfun
nnoremap <silent> <c-t> :exe 'Files ' . <SID>fzf_root()<CR>

" Investigate
let g:investigate_use_dash=1
nnoremap <leader>k :call investigate#Investigate('n')<CR>
vnoremap <leader>k :call investigate#Investigate('v')<CR>

" git and github
let g:github_complete_enable_neocomplete=1
let g:gitgutter_enabled = 1
let g:gitgutter_sign_modified =  '±'
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_map_keys = 0
let g:gitgutter_eager = 1
let g:gitgutter_realtime = 0

" incsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" tags (atags and tagbar)
autocmd! BufWritePost * call atags#generate()
nnoremap <leader>g :call atags#generate()<cr>
nnoremap <silent> <leader>t :TagbarToggle<CR>

" autocompletion (deoplete)
let g:deoplete#enable_at_startup=1
let deoplete#sources#jedi#show_docstring=1
let g:deoplete#auto_complete_start_length=3
let g:deoplete#disable_auto_complete = 0

" snippets (neosnippet)
let g:neosnippet#snippets_directory="~/.config/nvim/snippets"
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" syntax checking (neomake)
autocmd! BufWritePost * Neomake
let g:neomake_airline = 1
let g:neomake_error_sign = { 'text': '✘', 'texthl': 'ErrorSign' }
let g:neomake_warning_sign = { 'text': 'ϟ', 'texthl': 'WarningSign' }
let g:neomake_python_enabled_makers = ['flake8']

" tmux (slime / slimux)
nnoremap <leader>l :SlimuxREPLSendLine<CR>
nnoremap <leader>s :SlimuxREPLSendParagraph<CR>
vnoremap <leader>s :SlimuxREPLSendSelection<CR>
nnoremap <leader>v :SlimuxREPLConfigure<CR>

" quickscope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" airline preferences
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_theme='oceanicnext'

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

" Align blocks of text and keep them selected
vmap < <gv
vmap > >gv

" insert an underline
inoremap <C-u> <CR><Esc>kyyp^v$r-o

" ToggleMovement depending on location
function! ToggleMovement(firstOp, thenOp)
  let pos = getpos('.')
  execute "normal! " . a:firstOp
  if pos == getpos('.')
    execute "normal! " . a:thenOp
  endif
endfunction

" The original carat 0 swap
nnoremap <silent> 0 :call ToggleMovement('^', '0')<CR>

" How about H and L
nnoremap <silent> H :call ToggleMovement('H', 'L')<CR>
nnoremap <silent> L :call ToggleMovement('L', 'H')<CR>

" How about G and gg
nnoremap <silent> G :call ToggleMovement('G', 'gg')<CR>
nnoremap <silent> gg :call ToggleMovement('gg', 'G')<CR>

" }}}

" Leader commands -------------- {{{

" clear whitespace
nnoremap <leader>w :Wsp<CR>

" edit and source $MYVIMRC
nnoremap <leader>erc :tabf $MYVIMRC<CR>
nnoremap <leader>src :source $MYVIMRC<CR>

" Folding
nnoremap <leader>a za
nnoremap <leader>A zA
nnoremap <leader>o zo
nnoremap <leader>O zO
nnoremap <leader>c zc
nnoremap <leader>C zC
nnoremap <leader>m zM
nnoremap <leader>M zM

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
colorscheme OceanicNext
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete:h16

" startify settings
let g:startify_custom_header = startify#fortune#quote()
let g:startify_change_to_vcs_root=1
let g:startify_skiplist = ['.git/*']

" highlight past the 100th column
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
augroup highlighting
  autocmd!
  autocmd FileType python,js match OverLength /\%101v.\+/
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
