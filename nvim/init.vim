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

" FZF fuzzy file finder
"Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
"lug 'junegunn/fzf.vim'

" adds git commands (Gstatus, Gcommit, Gdiff)
Plug 'tpope/vim-fugitive'

" adds +/- symbols to the gutter for modified files
Plug 'airblade/vim-gitgutter'

" proper search highlighhting
Plug 'haya14busa/incsearch.vim'

" tabnine autocompletion
Plug 'zxqfl/tabnine-vim'

" autocompletion
" Plug 'roxma/nvim-completion-manager'
"Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'
"Plug 'ncm2/ncm2-jedi'

" auto format
"Plug 'Chiel92/vim-autoformat'

" syntax checker
"Plug 'w0rp/ale'

" quickscope (underline matches for f/t/F/T navigation)
"Plug 'unblevable/quick-scope'

" ys, cs, and ds surround operators
"Plug 'tpope/vim-surround'
"Plug 'wellle/targets.vim'

" adds a bunch of [] mappings
"Plug 'tpope/vim-unimpaired'

" adds repeat (.) abilities for surround, unimpaired
"Plug 'tpope/vim-repeat'

" add or remove comments easily
"Plug 'tomtom/tcomment_vim'

" LanguageClient
"Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

" tags (gutentag)
"Plug 'ludovicchabant/vim-gutentags'

" support for custom text objects (nouns)
"Plug 'kana/vim-textobj-user'

" make
"Plug 'neomake/neomake'

" better folding support
"Plug 'tmhedberg/SimpylFold'

" python text objects and motions (af, if, ac, ic, ]pf, ]pc)
"Plug 'bps/vim-textobj-python'

" python
" Plug 'nirum/vim-cute-python', {'for': 'python'}
" Plug 'alfredodeza/pytest.vim', {'for': 'python'}
" Plug 'fisadev/vim-isort', {'for': 'python'}
" Plug 'prakashdanish/vimport', {'for': 'python'}
"
" " haskell
" Plug 'neovimhaskell/haskell-vim', {'for': 'haskell'}
" Plug 'Twinside/vim-haskellConceal', {'for': 'haskell'}
"
" " LaTeX
" Plug 'lervag/vimtex', {'for': 'tex'}
" Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
"
" " javascript
" Plug 'pangloss/vim-javascript', {'for': 'javascript'}
" Plug 'mxw/vim-jsx', {'for': 'javascript'}
"
" " web
" Plug 'valloric/MatchTagAlways', {'for': 'html'}
" Plug 'ap/vim-css-color'
" Plug 'mattn/emmet-vim', {'for': 'html'}
"
" " color picker (:Pick)
" Plug 'DougBeney/pickachu'
"
" " other
" Plug 'tpope/vim-markdown', {'for': 'markdown'}
"
" base16 colorschemes
Plug 'chriskempson/base16-vim'

" gui-goodness
Plug 'ryanoasis/vim-devicons'
Plug 'chrisbra/unicode.vim'

" " vimwiki
" Plug 'vimwiki/vimwiki'

call plug#end()

" }}}

" Basic Settings ---------------------- {{{
syntax on                               " Enable syntax highlighting
filetype plugin indent on               " Enable filetype-specific indenting and plugins
nnoremap <SPACE> <nop>
let mapleader = "\<Space>"              " use the spacebar as my leader
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" 24-bit color!
if has('termguicolors')
  set termguicolors
endif

" use indentation for folding
set foldmethod=indent
set foldlevelstart=4

" tabs and indenting
set tabstop=2 shiftwidth=2 expandtab smartindent

" backup and swap files
set backup undofile
set directory=~/.vim-swp// undodir=~/.vim-undo// backupdir=~/.vim-backup//

" show relative line numbers + the absolute number for the current line
set relativenumber number

" searching
set gdefault ignorecase smartcase

" update the screen
set lazyredraw

" command window height
set cmdheight=1

" smooth sidescrolling
set sidescroll=1

" clipboard support in OS X
set clipboard+=unnamed

" }}}

" Plugin settings ----------------------- {{{

" " FZF
" fun! s:fzf_root()
"   let path = finddir(".git", expand("%:p:h").";")
"   return fnamemodify(substitute(path, ".git", "", ""), ":p:h")
" endfun
" nnoremap <silent> <c-t> :exe 'Files ' . <SID>fzf_root()<CR>
"
" " LanguageClient
" let g:LanguageClient_serverCommands = { }
" let g:LanguageClient_autoStart = 1
" nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
"
" " git and github
" let g:gitgutter_enabled = 1
" let g:gitgutter_sign_modified =  '±'
" let g:gitgutter_sign_added = '+'
" let g:gitgutter_sign_removed = '-'
" let g:gitgutter_map_keys = 0
" let g:gitgutter_eager = 0
" let g:gitgutter_realtime = 0
"
" " incsearch
" let g:incsearch#auto_nohlsearch = 1
" map n  <Plug>(incsearch-nohl-n)
" map N  <Plug>(incsearch-nohl-N)
" map *  <Plug>(incsearch-nohl-*)
" map #  <Plug>(incsearch-nohl-#)
" map g* <Plug>(incsearch-nohl-g*)
" map g# <Plug>(incsearch-nohl-g#)
"
" " enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()
"
" " autocompletion (ncm2) and ultisnips
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <buffer> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
"
" " ultisnips
" let g:UltiSnipsExpandTrigger="<c-e>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"
" " optional mapping provided by NCM. If you press `<c-u>` and nothing has been
" " typed, it will popup a list of snippets available
" nnoremap <silent> <leader>e <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>
"
" " scalpel
" nmap <Leader>r <Plug>(Scalpel)
"
" " syntax (ale)
" let g:ale_sign_column_always=1
" let g:ale_sign_error='✘'
" let g:ale_sign_warning='⚑'
"
" " (statusline) %{ALEGetStatusLine()}
" let g:ale_statusline_format = ['✘ %d', '⚑ %d', '✔ ok']
" let g:ale_python_mypy_options = '--ignore-missing-imports'
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
"
" " quickscope
" let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
"
" " vim-surround shortcuts
" nmap ) ysiw)
" nmap ( ysiw)
"
" " latex and tex conceal
" let g:tex_conceal="abdgm"
" let g:tex_flavor = "latex"
"
" " vimwiki
" let g:vimwiki_list = [{'path': '~/logs/wiki/', 'path_html': '~/logs/wiki/_html/', 'template_path': '~/logs/wiki/_html/template', 'template_default': 'default', 'template_ext': '.htm'}]
"
" " }}}

" Statusline ---------------------------- {{{

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return ' '.git.' '
  else
    return '     '
endfunction

" statusline symbols
let g:symbols={
      \ 'left_sep' : "\ue0b0",
      \ 'left_alt_sep': "\ue0b1",
      \ 'right_sep': "\ue0b2",
      \ 'right_alt_sep': "\ue0b3"
      \}

" Set up the colors for the status bar
function! SetStatusLineColorScheme()
    " Basic color presets
    exec 'hi User1 guifg=#eff1f5 guibg=#268bd2'
    exec 'hi User2 guifg=#268bd2'
    exec 'hi User3 guifg=#dfe1e8 gui=bold'
    exec 'hi User4 guifg=#dfe1e8 guibg=#2b303b'
  endfunc

let g:symbols={
      \ 'left_sep' : "\ue0b0",
      \ 'left_alt_sep': "\ue0b1",
      \ 'right_sep': "\ue0b2",
      \ 'right_alt_sep': "\ue0b3"
      \}

" set noshowmode
set laststatus=2
set statusline=
set statusline+=%1*\ %{GitInfo()}%*
set statusline+=%2*%{g:symbols['left_sep']}
set statusline+=\ %*%4*%<%F\ %{&readonly?'\ ':''}
set statusline+=%= " Separation point between left and right aligned items.
set statusline+=%2*%{g:symbols['right_sep']}
"set statusline+=%1*\ %{ALEGetStatusLine()}\ 
set statusline+=%1*\ 
set statusline+=\ %{WebDevIconsGetFileTypeSymbol()}\ 𝓁\ %l\ 𝒄\ %v%*

" }}}

" Generic Mappings ---------------------- {{{

" apply the q register with Q
nnoremap Q @q

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

" scrolloff
set scrolloff=5

" no startup message
set shortmess+=I

" }}}

" Leader commands -------------- {{{

" edit and source $MYVIMRC
nnoremap <leader>erc :tabf $MYVIMRC<CR>
nnoremap <leader>src :source $MYVIMRC<CR>

" commenting
nmap <leader>c gcc

" split to the bottom and right
set splitbelow
set splitright

" }}}

" " FileType-specific settings ---------------------- {{{
"
" augroup filetype_vim
"   autocmd!
"   autocmd FileType vim,zsh setlocal foldmethod=marker
"   autocmd BufWritePost .vimrc so $MYVIMRC
"   autocmd FileType vim setlocal fo-=c fo-=o
"   autocmd FileType zsh setlocal fo-=c fo-=o
" augroup END
"
" augroup filetype_python
"   autocmd!
"   autocmd BufRead,BufNewFile *.ipy set filetype=python
"   autocmd FileType python inoremap # X#
"   autocmd FileType python setlocal softtabstop=4
"   autocmd FileType python setlocal tabstop=4
"   autocmd FileType python setlocal shiftwidth=4
" augroup END
"
" augroup filetype_tex
"   autocmd!
"   autocmd FileType tex setlocal conceallevel=2
" augroup END
"
" " }}}
"
" " Abbreviations and Typos ---------------------- {{{
"
" " prose typos
" iabbrev adn     and
" iabbrev tehn    then
" iabbrev waht    what
" iabbrev teh     the
" iabbrev nriu    niru
" iabbrev rnage   range
"
" if has("user_commands")
"     command! -bang -nargs=? -complete=file E e<bang> <args>
"     command! -bang -nargs=? -complete=file W w<bang> <args>
"     command! -bang -nargs=? -complete=file Wq wq<bang> <args>
"     command! -bang -nargs=? -complete=file WQ wq<bang> <args>
"     command! -bang Wa wa<bang>
"     command! -bang WA wa<bang>
"     command! -bang Q q<bang>
"     command! -bang QA qa<bang>
"     command! -bang Qa qa<bang>
" endif
"
" " }}}

" Highlights, colors and themes ---------------------- {{{

" colorscheme
set background=dark
colorscheme base16-chalk

" " highlight past the 100th column
" highlight OverLength ctermbg=red ctermfg=white guibg=#A97070
" augroup highlighting
"   autocmd!
"   autocmd FileType python,js match OverLength /\%101v.\+/
" augroup END
"
" statusline colors
hi User1 guifg=#eff1f5 guibg=#268bd2
hi User2 guifg=#268bd2
hi User3 guifg=#dfe1e8 gui=bold
hi User4 guifg=#dfe1e8 guibg=#2b303b
augroup statusline
  autocmd!
  au InsertEnter * highlight User1 guifg=#2b303b guibg=#ebcb8b
  au InsertEnter * highlight User2 guifg=#ebcb8b
  au InsertLeave * highlight User1 guifg=#eff1f5 guibg=#268bd2
  au InsertLeave * highlight User2 guifg=#268bd2
augroup END

" }}}

" " Functions ---------------------- {{{
"
" " change directory to the root of the git repository
" function! s:root()
"   let me = expand('%:p:h')
"   let gitd = finddir('.git', me.';')
"   if empty(gitd)
"     echo "Not in git repo"
"   else
"     let gitp = fnamemodify(gitd, ':h')
"     echo "Change directory to: ".gitp
"     execute 'lcd' gitp
"   endif
" endfunction
" command! Root call s:root()
"
" " Toggle conceal level
" function! g:ToggleConceal()
"   if(&conceallevel)
"     setlocal conceallevel=0
"   else
"     setlocal conceallevel=1
"   endif
" endfunc
" command! Cute call g:ToggleConceal()
"
" " removes trailing whitespace
" function! g:RemoveTrailingWhitespace()
"   let l = line(".")
"   let c = col(".")
"   silent! execute ':%s/\s\+$//e'
"   call cursor(l, c)
" endfunc
" command! Wsp call g:RemoveTrailingWhitespace()
"
" }}}
