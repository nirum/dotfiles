-- plugins.lua
-- Author: Niru Maheswaranathan
-- Website: https://github.com/nirum/dotfiles

packer = require('packer')

packer.startup(function(use) 
  use 'wbthomason/packer.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'tpope/vim-commentary'                      -- comments
  use 'tpope/vim-surround'                        -- quotes/parens/brackets/etc
  use 'lukas-reineke/indent-blankline.nvim'       -- indent guides
  use 'norcalli/nvim-colorizer.lua'               -- color hex codes
  use 'tpope/vim-surround'                        -- ()[]{}
  use 'lukas-reineke/indent-blankline.nvim'       -- indent guides
  use 'norcalli/nvim-colorizer.lua'               -- color hex codes
  use 'lewis6991/gitsigns.nvim'                   -- git sign column
  use 'tpope/vim-fugitive'                        -- git command support
  use 'neovim/nvim-lspconfig'                     -- LSP
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'hrsh7th/nvim-cmp'                          -- Completion Engine
  use 'nvim-telescope/telescope.nvim'             -- Fuzzy Finding
  use 'sbdchd/neoformat'                          -- yapf formatting
  use 'folke/tokyonight.nvim'                     -- Theme
  use 'kyazdani42/nvim-web-devicons'              -- Icons
  use 'nvim-lualine/lualine.nvim'                 -- Status line
end)
