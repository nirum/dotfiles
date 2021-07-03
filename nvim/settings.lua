-- settings.lua
-- Author: Niru Maheswaranathan
-- Website: https://github.com/nirum/dotfiles

-- LSPConfig
local nvim_lsp = require 'lspconfig'
nvim_lsp.pyright.setup{}
nvim_lsp.tsserver.setup{}

local saga = require 'lspsaga'
saga.init_lsp_saga {
  error_sign = 'x',
  warn_sign = 'w',
  hint_sign = 'h',
  infor_sign = 'i',
  border_style = "round",
}

-- Treesitter
require 'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {}
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "json",
    "html",
    "python",
    "latex",
    "bibtex",
    "bash",
    "lua"
  }
}

-- Telescope
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}

-- Theme
vim.g.tokyonight_style = "night"
vim.g.tokyonight_lualine_bold = true
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_italic_keywords = true
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_italic_variables = false
vim.cmd[[colorscheme tokyonight]]

-- lualine
local lualine = require 'lualine'
lualine.setup {
  options = {theme = 'tokyonight'}
}
