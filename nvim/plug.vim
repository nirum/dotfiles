" plug.vim
" Author: Niru Maheswaranathan
" Website: https://github.com/nirum/dotfiles

call plug#begin('~/.vim/plugged')

" Utilities
Plug 'tpope/vim-commentary'                                 " easy comments
Plug 'tpope/vim-surround'                                   " quotes/parens/brackets/etc
" Plug 'AndrewRadev/splitjoin.vim'                            " gS and gJ
" Plug 'Yggdroot/indentLine'                                  " Indentation lines

" Core
Plug 'neovim/nvim-lspconfig'                                " LSP
Plug 'glepnir/lspsaga.nvim'                                 " LSP UI
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Treesitter
Plug 'nvim-lua/completion-nvim'                             " Completion Engine
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'                        " Fuzzy Finding

" Style
Plug 'arcticicestudio/nord-vim'                             " Theme
Plug 'hoob3rt/lualine.nvim'                                 " Status line
Plug 'kyazdani42/nvim-web-devicons'                         " Icons

" Search
" Plug 'junegunn/fzf'                                         " fuzzy finder
" Plug 'junegunn/fzf.vim'                                     " fzf bindings

call plug#end()
