-- settings.lua
-- Author: Niru Maheswaranathan
-- Website: https://github.com/nirum/dotfiles

-- LSPConfig
local nvim_lsp = require 'lspconfig'
nvim_lsp.pyright.setup{}
nvim_lsp.tsserver.setup{}

-- local saga = require 'lspsaga'
-- saga.init_lsp_saga {
--   error_sign = ' ',
--   warn_sign = ' ',
--   hint_sign = ' ',
--   infor_sign = ' ',
--   border_style = "round",
-- }

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
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-[>"] = actions.close,
      },
      n = {
        ["q"] = actions.close
      },
    },
  }
}


-- Completion
require'cmp'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    -- winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = false;
    ultisnips = false;
    luasnip = false;
  };
}

-- Colorizer
require 'colorizer'.setup()

-- Theme
vim.g.tokyonight_style = "night"
vim.g.tokyonight_lualine_bold = true
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_italic_keywords = true
vim.g.tokyonight_italic_functions = false
vim.g.tokyonight_italic_variables = false
vim.cmd[[colorscheme tokyonight]]

-- lualine
local lualine = require 'lualine'
lualine.setup {
  options = {theme = 'tokyonight'}
}

-- git signs
require('gitsigns').setup()
