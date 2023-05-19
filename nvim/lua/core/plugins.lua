-- plugins.lua
-- Author: Niru Maheswaranathan
-- Website: https://github.com/nirum/dotfiles

-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

packer = require("packer")

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

packer.startup({
  function(use)

    use("wbthomason/packer.nvim") -- Package manager.
    use("lewis6991/impatient.nvim") -- Speeds up neovim startup time.

    use { -- LSP Configuration & Plugins.
      "neovim/nvim-lspconfig",
      requires = {
        -- Automatically install LSPs to stdpath for neovim.
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        -- Useful status updates for LSP.
        "j-hui/fidget.nvim",

        -- Symbols for LSP.
        "onsails/lspkind-nvim"
      }
    }

    use { -- Autocompletion.
      "hrsh7th/nvim-cmp",
      requires = {
        -- Other completion sources
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",

        -- Snippets
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
      }
    }

    use { -- Highlight, edit, and navigate code
      'nvim-treesitter/nvim-treesitter',
      run = function()
        pcall(require('nvim-treesitter.install').update { with_sync = true })
      end,
    }

    use { -- Additional text objects via treesitter
      'nvim-treesitter/nvim-treesitter-textobjects',
      after = 'nvim-treesitter',
    }

    use { -- Telescope
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
      },
    }

    use {
      "hkupty/iron.nvim",
    }

    use("sbdchd/neoformat") -- yapf formatting
    use("folke/tokyonight.nvim") -- Colorscheme.

    use({ -- Statusline.
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

    use({ -- 'gc' to comment regions/lines.
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup()
      end,
    })
    use({ -- Adds indent guidelines.
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("indent_blankline").setup()
      end,
    })
    use("lewis6991/gitsigns.nvim") -- Git sign column.
    use("tpope/vim-sleuth") -- Detect tabstop and shiftwidth automatically.

    use({ -- Test runner.
      "klen/nvim-test",
      config = function()
        require('nvim-test').setup()
      end
    })

    if is_bootstrap then
      packer.sync()
    end
  end,
})

if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end
