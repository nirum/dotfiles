-- settings.lua
-- Author: Niru Maheswaranathan
-- Website: https://github.com/nirum/dotfiles

-- LSPConfig
local nvim_lsp = require('lspconfig')
nvim_lsp.pyright.setup{}
nvim_lsp.tsserver.setup{}

-- Treesitter
require('nvim-treesitter.configs').setup {
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
require('telescope').setup({
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
  },
  extensions = {
    dash = {
      dash_app_path = '/Applications/Dash.app',
      search_engine = 'ddg',
        file_type_keywords = {
        dashboard = false,
        NvimTree = false,
        TelescopePrompt = false,
        terminal = false,
        packer = false,
        -- a table of strings will search on multiple keywords
        python = { 'py', 'np', 'scipy', 'pd', 'plt', 'pl', 'torch' },
        -- you can also do a string, for example,
        bash = 'sh'
      },
    },
  }
})

-- lspkind
local lspkind = require('lspkind')
lspkind.init({})

-- Completion
local cmp = require('cmp')
cmp.setup({
  mapping = {
    -- ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- ['<C-Space>'] = cmp.mapping.complete(),
    -- ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  },
  sources = cmp.config.sources({
    -- { name = "nvim_lua" },
    -- { name = "zsh" },

    { name = "nvim_lsp" },
    { name = "path" },
    -- { name = "luasnip" },
    { name = "buffer", keyword_length = 5 },

    -- { name = 'nvim_lsp' },
    -- { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }),
  formatting = {
    format = lspkind.cmp_format({with_text = false, maxwidth = 50})
  }
})

-- Colorizer
require('colorizer').setup()

-- Theme
vim.g.tokyonight_style = "night"
vim.g.tokyonight_lualine_bold = true
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_italic_keywords = true
vim.g.tokyonight_italic_functions = false
vim.g.tokyonight_italic_variables = false
vim.cmd[[colorscheme tokyonight]]

-- lualine
require('lualine').setup({
  options = {theme = 'tokyonight'}
})

-- git signs
require('gitsigns').setup()
