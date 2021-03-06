" plug.vim
" Author: Niru Maheswaranathan
" Website: https://github.com/nirum/dotfiles

call plug#begin('~/.vim/plugged')

" Utilities
Plug 'tpope/vim-commentary'                                 " easy comments
Plug 'tpope/vim-surround'                                   " quotes/parens/brackets/etc
Plug 'lewis6991/gitsigns.nvim'                              " git sign column
Plug 'lukas-reineke/indent-blankline.nvim'                  " indent guides
Plug 'kyazdani42/nvim-tree.lua'                             " file explorer
Plug 'norcalli/nvim-colorizer.lua'                          " color hex codes

" LSP
Plug 'neovim/nvim-lspconfig'                                " LSP
Plug 'glepnir/lspsaga.nvim'                                 " LSP UI
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Treesitter

" Completion
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'hrsh7th/nvim-compe'                                   " Completion Engine
Plug 'nvim-telescope/telescope.nvim'                        " Fuzzy Finding

" Style
Plug 'folke/tokyonight.nvim'                                " Theme
Plug 'kyazdani42/nvim-web-devicons'                         " Icons
Plug 'hoob3rt/lualine.nvim'                                 " Status line
Plug 'romgrk/barbar.nvim'                                   " Tab line

call plug#end()
