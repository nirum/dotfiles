" init.vim
" Author: Niru Maheswaranathan
" Website: https://github.com/nirum/dotfiles

" Plugins ------------------------- {{{

call plug#begin('~/.vim/plugged')

" FZF fuzzy file finder
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
"nnoremap ; :Buffers<CR>
"nnoremap f :Files<CR>
"nnoremap T :Tags<CR>
"nnoremap t :BTags<CR>
"nnoremap s :Ag<CR>

" General
Plug 'haya14busa/incsearch.vim'         " Proper search highlighhting
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
nnoremap <Esc> :noh<CR>

" version control
Plug 'mhinz/vim-signify'

" Autocompletion
Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

inoremap <silent><expr> <c-j>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><c-k> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-e> coc#refresh()
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
let g:coc_snippet_prev="<S-TAB>"
let g:coc_snippet_next="<TAB>"

" Plug 'roxma/nvim-completion-manager'
"Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'
"Plug 'ncm2/ncm2-jedi'

" syntax checker
Plug 'w0rp/ale'

" ys, cs, and ds surround operators
"Plug 'tpope/vim-surround'
"Plug 'wellle/targets.vim'

" support for custom text objects (nouns)
Plug 'kana/vim-textobj-user'

" python text objects and motions (af, if, ac, ic, ]pf, ]pc)
Plug 'bps/vim-textobj-python'

" base16 colorschemes
Plug 'chriskempson/base16-vim'

call plug#end()

" }}}

" Basic Settings ---------------------- {{{
syntax on                               " Enable syntax highlighting
filetype plugin indent on               " Enable filetype-specific indenting and plugins
nnoremap <SPACE> <nop>
let mapleader = "\<Space>"              " use the spacebar as my leader

" 24-bit color!
set termguicolors

" use indentation for folding
"set foldmethod=indent
"set foldlevelstart=4

" tabs and indenting
set tabstop=2 shiftwidth=2 expandtab smartindent

" persistent undo
set undofile
set undodir=~/.vim-undo

" live on the edge
set nobackup
set nowritebackup

" use system clipboard
set clipboard+=unnamed

" show relative line numbers + the absolute number for the current line
set relativenumber number

" searching
set gdefault ignorecase smartcase

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
" " enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()
"
" " autocompletion (ncm2) and ultisnips
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <buffer> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
"
" ultisnips
"let g:UltiSnipsExpandTrigger="<c-e>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" " optional mapping provided by NCM. If you press `<c-u>` and nothing has been
" " typed, it will popup a list of snippets available
" nnoremap <silent> <leader>e <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>
"
" " scalpel
" nmap <Leader>r <Plug>(Scalpel)
"
" " syntax (ale)
set signcolumn=yes
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

" set noshowmode
"set laststatus=2
"set statusline=
"set statusline+=%1*\ %{GitInfo()}%*
"set statusline+=%2*%{g:symbols['left_sep']}
"set statusline+=\ %*%4*%<%F\ %{&readonly?'\ ':''}
"set statusline+=%= " Separation point between left and right aligned items.
"set statusline+=%2*%{g:symbols['right_sep']}
"set statusline+=%1*\ %{ALEGetStatusLine()}\ 
"set statusline+=%1*\ 
"set statusline+=\ %{WebDevIconsGetFileTypeSymbol()}\ 𝓁\ %l\ 𝒄\ %v%*

" }}}

" Generic Mappings ---------------------- {{{

" circular window navigation
"nnoremap <tab>   gt
"nnoremap <S-tab> gT

" undo after ctrl-c
"inoremap <c-c> <c-c>u

" exit insert, dd line, enter insert
"inoremap <c-d> <esc>ddi


" reduce having to type shift for commands
nnoremap ; :
nnoremap : ;

" swap " and ' for easier registers
nnoremap " '
nnoremap ' "

" yank without jank
"vnoremap <expr>y "my\"" . v:register . "y`y"

" scrolloff
"set scrolloff=5

" no startup message
"set shortmess+=I

" }}}

" Leader commands -------------- {{{

" edit and source $MYVIMRC
"nnoremap <leader>erc :tabf $MYVIMRC<CR>
"nnoremap <leader>src :source $MYVIMRC<CR>

" commenting
"nmap <leader>c gcc

" split to the bottom and right
"set splitbelow
"set splitright

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
"hi User1 guifg=#eff1f5 guibg=#268bd2
"hi User2 guifg=#268bd2
"hi User3 guifg=#dfe1e8 gui=bold
"hi User4 guifg=#dfe1e8 guibg=#2b303b
"augroup statusline
"  autocmd!
"  au InsertEnter * highlight User1 guifg=#2b303b guibg=#ebcb8b
"  au InsertEnter * highlight User2 guifg=#ebcb8b
"  au InsertLeave * highlight User1 guifg=#eff1f5 guibg=#268bd2
"  au InsertLeave * highlight User2 guifg=#268bd2
"augroup END

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
