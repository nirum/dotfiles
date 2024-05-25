return {

  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- Completion source for LSP.
    { "antosha417/nvim-lsp-file-operations", config = true },
  },

  config = function()
    local lspconfig = require("lspconfig")
    local ts = require("telescope.builtin")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local on_attach = function(_, bufnr)
      -- Helper function to define keybindings.
      local nmap = function(keys, func, desc)
        if desc then
          desc = "LSP: " .. desc
        end

        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc, noremap = true, silent = true })
      end

      -- Keybindings
      nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
      nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
      nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
      nmap("gr", ts.lsp_references, "[G]oto [R]eferences")
      nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
      nmap("<leader>ds", ts.lsp_document_symbols, "[D]ocument [S]ymbols")
      nmap("<leader>ws", ts.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
      nmap("K", vim.lsp.buf.hover, "Hover Documentation")
      nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
      nmap("[d", vim.diagnostic.goto_prev, "Jump to previous diagnostic")
      nmap("]d", vim.diagnostic.goto_next, "Jump to next diagnostic")
      nmap("<leader>D", ts.diagnostics, "List [D]iagnostics for file")
      nmap("<leader>d", vim.diagnostic.open_float, "Show [d]iagnostic for line")
    end

    -- Used to enable autocompletion (assign to every lsp server config).
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Enable the following language servers
    local servers = { "clangd", "rust_analyzer", "tsserver", "jsonls" }
    for _, server in ipairs(servers) do
      lspconfig[server].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end

    -- configure lua server with custom settings
    lspconfig["lua_ls"].setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end,
}
