vim.lsp.enable({
  "ruff",
  "pyrefly",
  "lua_ls",
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

--
-- vim.lsp.enable("lua_ls")
    --   ts_ls = {},
    --   ruff = {},
    --   pylsp = {
    --     settings = {
    --       pylsp = {
    --         plugins = {
    --           pyflakes = { enabled = false },
    --           pycodestyle = { enabled = false },
    --           autopep8 = { enabled = false },
    --           yapf = { enabled = false },
    --           mccabe = { enabled = false },
    --           pylsp_mypy = { enabled = false },
    --           pylsp_black = { enabled = false },
    --           pylsp_isort = { enabled = false },
    --         },
    --       },
    --     },
    --   },
    --   html = { filetypes = { "html", "twig", "hbs" } },
    --   cssls = {},
    --   tailwindcss = {},
    --   dockerls = {},
    --   sqlls = {},
    --   terraformls = {},
    --   jsonls = {},
    --   yamlls = {},
    --
    --   lua_ls = {
    --     -- cmd = {...},
    --     -- filetypes = { ...},
    --     -- capabilities = {},
    --     settings = {
    --       Lua = {
    --         completion = {
    --           callSnippet = "Replace",
    --         },
    --         runtime = { version = "LuaJIT" },
    --         workspace = {
    --           checkThirdParty = false,
    --           library = {
    --             "${3rd}/luv/library",
    --             unpack(vim.api.nvim_get_runtime_file("", true)),
    --           },
    --         },
    --         diagnostics = { disable = { "missing-fields" } },
    --         format = {
    --           enable = false,
    --         },
    --       },
    --     },
    --   },
    -- }
