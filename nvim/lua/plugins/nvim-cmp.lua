return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",             -- source for text in buffer
    "hrsh7th/cmp-path",               -- source for filesystem paths
    -- "hrsh7th/cmp-nvim-lsp",           -- source for LSP
    "L3MON4D3/LuaSnip",               -- snippet engine
    "saadparwaiz1/cmp_luasnip",       -- source for autocompletion
    "rafamadriz/friendly-snippets",   -- predefined snippets
  },

  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- load vscode style snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({

      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },

      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),   -- scroll up through completions
        ["<C-j>"] = cmp.mapping.select_next_item(),   -- scroll down through completions
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),      -- scroll up through docs window
        ["<C-f>"] = cmp.mapping.scroll_docs(4),       -- scroll down through docs window
        ["<C-Space>"] = cmp.mapping.complete(),       -- show completion suggestions
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),

        -- ['<CR>'] = cmp.mapping.confirm {
        --   behavior = cmp.ConfirmBehavior.Replace,
        --   select = true,
        -- },
        -- ['<Tab>'] = cmp.mapping(function(fallback)
        --   if cmp.visible() then
        --     cmp.select_next_item()
        --   elseif luasnip.expand_or_jumpable() then
        --     luasnip.expand_or_jump()
        --   else
        --     fallback()
        --   end
        -- end, { 'i', 's' }),
        -- ['<S-Tab>'] = cmp.mapping(function(fallback)
        --   if cmp.visible() then
        --     cmp.select_prev_item()
        --   elseif luasnip.jumpable(-1) then
        --     luasnip.jump(-1)
        --   else
        --     fallback()
        --   end
        -- end, { 'i', 's' }),
      -- },
      -- sources = {
      --   { name = 'nvim_lsp' },
      --   { name = 'luasnip' },
      -- },
    })

  end
}
