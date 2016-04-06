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

" start-up screen
Plug 'mhinz/vim-startify'

" navigation
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" the silver searcher (ag) and a gag verb
Plug 'rking/ag.vim'
Plug 'Chun-Yang/vim-action-ag'

" splits (gS) or joins (gJ) multiple lines
" Plug 'AndrewRadev/splitjoin.vim'

" colors and themes
Plug 'mhartington/oceanic-next'

" custom text objects
" Plug 'kana/vim-textobj-user'

" Text object plug-ins motion for function arguments
" Plug 'vim-scripts/argtextobj.vim'

" motions for commenting text: g>c, g<c, gc{motion}
Plug 'tomtom/tcomment_vim'

" verb to change or modify surrounding quotes/tags/etc (ys, ds, cs)
Plug 'tpope/vim-surround'

" lets the '.' repeat more commands
Plug 'tpope/vim-repeat'

" working with git and GitHub
Plug 'tpope/vim-fugitive'
Plug 'rhysd/github-complete.vim'
Plug 'airblade/vim-gitgutter'

" motions for blocks of indented text: [-, [+, [=, ]-, ]+, ]=
" Plug 'jeetsukumaran/vim-indentwise'
" Plug 'michaeljsmith/vim-indent-object'

Plug 'scrooloose/nerdtree'

" show vertical line indent marks
Plug 'Yggdroot/indentLine'

" better search
Plug 'haya14busa/incsearch.vim'

" tags
" {{{
Plug 'fntlnz/atags.vim'
Plug 'majutsushi/tagbar'
map <Leader>g :call atags#generate()<cr>
nnoremap <silent> <leader>t :TagbarToggle<CR>
" }}}

" autocompletion
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi'
" {{{

let g:deoplete#enable_at_startup=1
let deoplete#sources#jedi#show_docstring=0

" Insert <TAB> or select next match
" inoremap <silent> <expr> <Tab> utils#tabComplete()

" Manually trigger tag autocomplete
" inoremap <silent> <expr> <C-]> utils#manualTagComplete()

" }}}

" snippets
" Plug 'SirVer/ultisnips'

" syntax checker (syntastic)
Plug 'benekastah/neomake'

" distraction free writing (goyo)
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" quickscope (underline matches for f/t/F/T navigation)
Plug 'unblevable/quick-scope'

" gui-goodness
Plug 'ryanoasis/vim-devicons'

" editing
Plug 'cohama/lexima.vim'

" tmux
Plug 'christoomey/vim-tmux-navigator'

" LaTeX
" Plug 'lervag/vimtex'
" Plug 'matze/vim-tex-fold'

" python
Plug 'nirum/vim-cute-python', { 'for': 'python' }

" haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'Twinside/vim-haskellConceal', { 'for': 'haskell' }

" julia
Plug 'JuliaLang/julia-vim'

" javascript
" Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" Plug 'mxw/vim-jsx'

" web design
Plug 'valloric/MatchTagAlways', {'for': 'html'}
Plug 'ap/vim-css-color'

" Plug 'mattn/emmet-vim', {'for': 'html'}

  " call dein#add('elzr/vim-json', {'on_ft': 'json'})
  " call dein#add('tpope/vim-markdown', {'on_ft': 'markdown'})
  "
  " call dein#add('Raimondi/delimitMate', {'on_ft': ['javascript', 'typescript', 'css', 'scss']})


"   call dein#add('AndrewRadev/switch.vim')
"   call dein#add('christoomey/vim-tmux-navigator')
"   call dein#add('tmux-plugins/vim-tmux')
"   call dein#add('tmux-plugins/vim-tmux-focus-events')
"
"   mattn/emmet-vim
"   mattn/gist-vim
"   vim-scripts/Syntax-Range
"   zchee/deoplete-jedi

" editor
Plug 'vim-airline/vim-airline'

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

" clipboard support in OS X
set clipboard=unnamed

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

" navigation
nnoremap J 5j
nnoremap K 5k

" }}}

" Leader commands -------------- {{{

" clear whitespace
nnoremap <leader>w :Whitespace<CR>

" edit and source $MYVIMRC
nnoremap <leader>erc :tabf $MYVIMRC<CR>
nnoremap <leader>src :source $MYVIMRC<CR>

" reduce having to type shift for commands
nnoremap ; :
nnoremap : ;

" autocomplete files using <c-f> in insert mode
inoremap <c-f> <c-x><c-f>

" Align blocks of text and keep them selected
vmap < <gv
vmap > >gv

" }}}

" Plugin Settings -------------- {{{

" vim-airline (statusline)
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_theme='oceanicnext'

" github autocompletion
let g:github_complete_enable_neocomplete=1

" ultisnips
" let g:UltiSnipsExpandTrigger="<c-e>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" let g:UltiSnipsSnippetDirectories=["ultisnips"]

" autocmd FileType python setlocal omnifunc=jedi#completions
" let g:jedi#completions_enabled = 0
" let g:jedi#auto_vim_configuration = 0
" let g:neocomplete#force_omni_input_patterns.python =
  " \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

" quickscope
" let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" startify
let g:startify_custom_header = startify#fortune#quote()
let g:startify_change_to_vcs_root=1
let g:startify_skiplist = ['.git/*']

" fzf
nnoremap <silent> <c-t> :Files<cr>

fun! s:fzf_root()
  let path = finddir(".git", expand("%:p:h").";")
  return fnamemodify(substitute(path, ".git", "", ""), ":p:h")
endfun

nnoremap <silent> <Leader>ff :exe 'Files ' . <SID>fzf_root()<CR>


" fast grep with ag
set grepprg=ag\ --nogroup\ --nocolor

" comment visual selection
vnoremap <c-/> :TComment<cr>

" incsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" indented line marker color
let g:indentLine_color_gui = '#87C0CC'

" git-gutter
let g:gitgutter_enabled = 1
let g:gitgutter_sign_modified =  'm'
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_map_keys = 0
let g:gitgutter_eager = 1
let g:gitgutter_realtime = 0

" neomake
" {{{
autocmd! BufWritePost * Neomake
let g:neomake_airline = 1
let g:neomake_error_sign = { 'text': '✘', 'texthl': 'ErrorSign' }
let g:neomake_warning_sign = { 'text': ':(', 'texthl': 'WarningSign' }
" }}}

" map <F4> :lopen<CR>
map <leader>rm :Neomake<CR>
" }}}

" latex
" let g:tex_flavor='latex'

" }}}

" FileType-specific settings ---------------------- {{{

augroup filetype_vim
  autocmd!
  autocmd FileType vim,zsh setlocal foldmethod=marker
augroup END

" augroup filetype_python
  " autocmd!
  " autocmd BufRead,BufNewFile *.ipy set filetype=python
  " autocmd FileType python inoremap # X#
  " autocmd FileType python setlocal softtabstop=4
  " autocmd FileType python setlocal shiftwidth=4
" augroup END

" When loading text files, wrap them and don't split up words
augroup textfiles
  autocmd!
  autocmd BufNewFile,BufRead *.txt setlocal wrap
  autocmd BufNewFile,BufRead *.txt setlocal lbr

  " set spelling
  autocmd BufRead,BufNewFile *.md setlocal spell complete+=kspell
  autocmd BufRead,BufNewFile *.md hi SpellBad guibg=#ff2929 guifg=#ffffff" ctermbg=224

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
colorscheme OceanicNext
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete:h16

" highlight the 80th column
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
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
    silent! execute ':%s/\s\+$//e'
endfunc
command! Whitespace call g:RemoveTrailingWhitespace()

" }}}
