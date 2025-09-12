(vim.lsp.enable ["ruff" "pyrefly" "lua_ls"])
(vim.api.nvim_create_autocmd "LspAttach"
  {:callback
    (fn [ev]
      (let [client (vim.lsp.get_client_by_id ev.data.client_id)]
        (when (client:supports_method "textDocument/completion")
          (vim.lsp.completion.enable true client.id ev.buf {:autotrigger true}))))})

nil
