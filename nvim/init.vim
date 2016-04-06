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
" {{{
Plug 'mhinz/vim-startify'
let g:startify_custom_header = startify#fortune#quote()
let g:startify_change_to_vcs_root=1
let g:startify_skiplist = ['.git/*']
" }}}

" FZF
" {{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" nnoremap <silent> <c-t> :Files<cr>
fun! s:fzf_root()
  let path = finddir(".git", expand("%:p:h").";")
  return fnamemodify(substitute(path, ".git", "", ""), ":p:h")
endfun
nnoremap <silent> <c-t> :exe 'Files ' . <SID>fzf_root()<CR>
" }}}

" the silver searcher (ag) and a gag verb
Plug 'rking/ag.vim'
Plug 'Chun-Yang/vim-action-ag'

" motions for commenting text: g>c, g<c, gc{motion}
" {{{
Plug 'tomtom/tcomment_vim'
" comment shortcuts
" <Leader>__ :Tcomment
" <Leader>_p :Tcomment inner paragraph
" <c--><c--> :Tcomment
" }}}

" git and GitHub
" {{{
Plug 'tpope/vim-fugitive'
Plug 'rhysd/github-complete.vim'
Plug 'airblade/vim-gitgutter'
let g:github_complete_enable_neocomplete=1
let g:gitgutter_enabled = 1
let g:gitgutter_sign_modified =  'm'
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_map_keys = 0
let g:gitgutter_eager = 1
let g:gitgutter_realtime = 0
" }}}

" incsearch
" {{{
Plug 'haya14busa/incsearch.vim'
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" }}}

" tags
" {{{
Plug 'fntlnz/atags.vim'
Plug 'majutsushi/tagbar'
map <Leader>g :call atags#generate()<cr>
nnoremap <silent> <leader>t :TagbarToggle<CR>
" }}}

" autocompletion
" {{{
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi'

let g:deoplete#enable_at_startup=1
let deoplete#sources#jedi#show_docstring=0

" Insert <TAB> or select next match
" inoremap <silent> <expr> <Tab> utils#tabComplete()

" Manually trigger tag autocomplete
" inoremap <silent> <expr> <C-]> utils#manualTagComplete()
" }}}

" snippets
" Plug 'SirVer/ultisnips'
" let g:UltiSnipsExpandTrigger="<c-e>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" let g:UltiSnipsSnippetDirectories=["ultisnips"]

" syntax checker (neomake)
" {{{
Plug 'benekastah/neomake'
autocmd! BufWritePost * Neomake
let g:neomake_airline = 1
let g:neomake_error_sign = { 'text': '✘', 'texthl': 'ErrorSign' }
let g:neomake_warning_sign = { 'text': ':(', 'texthl': 'WarningSign' }
" }}}

" quickscope (underline matches for f/t/F/T navigation)
" {{{
Plug 'unblevable/quick-scope'
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" }}}

" sugar
" {{{
" colorschemes
Plug 'mhartington/oceanic-next'

" gui-goodness
Plug 'ryanoasis/vim-devicons'

" show vertical line indent marks
Plug 'Yggdroot/indentLine'
let g:indentLine_color_gui = '#87C0CC'

" weakness
Plug 'scrooloose/nerdtree'
" }}}

" editing
" {{{
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" autoclose
Plug 'cohama/lexima.vim'
" Plug ''Raimondi/delimitMate', {'on_ft': ['javascript', 'typescript', 'css', 'scss']})

" distraction free writing (goyo)
Plug 'junegunn/goyo.vim'
" }}}

" tmux
" {{{
Plug 'christoomey/vim-tmux-navigator'
" Plug 'tmux-plugins/vim-tmux'
" Plug 'tmux-plugins/vim-tmux-focus-events'
" }}}

" language support
" {{{
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

" web design
Plug 'valloric/MatchTagAlways', {'for': 'html'}
Plug 'ap/vim-css-color'
" Plug 'mattn/emmet-vim', {'for': 'html'}

" Plug 'elzr/vim-json', {'on_ft': 'json'}
" Plug 'tpope/vim-markdown', {'on_ft': 'markdown'}

" }}}

" vim-airline (statusline)
" {{{
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_theme='oceanicnext'
" }}}

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

" FileType-specific settings ---------------------- {{{

augroup filetype_vim
  autocmd!
  autocmd FileType vim,zsh setlocal foldmethod=marker
augroup END

augroup filetype_python
  autocmd!
  autocmd BufRead,BufNewFile *.ipy set filetype=python
  autocmd FileType python inoremap # X#
  autocmd FileType python setlocal softtabstop=4
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

" }}}

" Highlights, colors and themes ---------------------- {{{

" colorscheme
set background=dark
map <Leader>bg :let &background = (&background == "dark"? "light" : "dark")<CR>
colorscheme OceanicNext
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete:h16

" highlight past the 80th column
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
