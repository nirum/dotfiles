-- plugins.lua
-- Author: Niru Maheswaranathan
-- Website: https://github.com/nirum/dotfiles

-- Use a protected call in case packer is not installed.
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Autocommand that reloads neovim whenever we save this file.
vim.cmd [[
  augroup packer_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

packer.startup(function(use) 

  use 'wbthomason/packer.nvim'                    -- Haver packer manage itself.
  use 'nvim-lua/popup.nvim'                       -- An implementation of the Popup API in neovim.
  use 'nvim-lua/plenary.nvim'                     -- Useful lua functions used by lots of plugins.

  -- use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use 'tpope/vim-commentary'                      -- comments
  -- use 'tpope/vim-surround'                        -- quotes/parens/brackets/etc
  -- use 'tpope/vim-unimpaired'                      -- [] mappings

  -- use 'lukas-reineke/indent-blankline.nvim'       -- indent guides
  -- use 'norcalli/nvim-colorizer.lua'               -- color hex codes

  -- use 'lewis6991/gitsigns.nvim'                   -- git sign column
  -- use 'tpope/vim-fugitive'                        -- git command support

  -- use 'neovim/nvim-lspconfig'                     -- LSP
  -- use 'mfussenegger/nvim-dap'                     -- DAP
  -- use 'mfussenegger/nvim-dap-python'              -- pip install debugpy

  use 'hrsh7th/nvim-cmp'                          -- Completion Engine
  use 'hrsh7th/cmp-path'                          -- [cmp] path source
  use 'hrsh7th/cmp-buffer'                        -- [cmp] buffer source
  use 'hrsh7th/cmp-cmdline'                        -- [cmp] buffer source

  -- use 'hrsh7th/cmp-nvim-lsp'                      -- [cmp] LSP source
  -- use 'onsails/lspkind-nvim'                      -- adds symbols to LSP completion

  use 'L3MON4D3/LuaSnip'                          -- snippets engine
  use 'rafamadriz/friendly-snippets'              -- preset snippets

  -- use 'nvim-telescope/telescope.nvim'             -- Fuzzy Finding
  -- use 'nvim-telescope/telescope-dap.nvim'
  -- use 'sbdchd/neoformat'                          -- yapf formatting
  --
  use 'folke/tokyonight.nvim'                     -- colorscheme

  -- use {
    -- 'nvim-lualine/lualine.nvim',
    -- requires = {'kyazdani42/nvim-web-devicons', opt = true}
  -- }

  -- use { 
  --   'kdheepak/tabline.nvim',
  --   config = function()
  --     require('tabline').setup({
  --       -- Defaults configuration options
  --       enable = true,
  --       options = {
  --       -- If lualine is installed tabline will use separators configured in lualine by default.
  --       -- These options can be used to override those settings.
  --         section_separators = {'', ''},
  --         component_separators = {'', ''},
  --         max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
  --         show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
  --         show_devicons = true, -- this shows devicons in buffer section
  --         show_bufnr = false, -- this appends [bufnr] to buffer section,
  --         show_filename_only = false, -- shows base filename only instead of relative path in filename
  --       }
  --     })
  --   end,
  --   requires = { { 'nvim-lualine/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }
  -- }

end)
