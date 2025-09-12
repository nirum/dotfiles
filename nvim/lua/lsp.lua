vim.lsp.enable({"ruff", "pyrefly", "lua_ls"})
local function _1_(ev)
  local client = vim.lsp.get_client_by_id(ev.data.client_id)
  if client:supports_method("textDocument/completion") then
    return vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
  else
    return nil
  end
end
vim.api.nvim_create_autocmd("LspAttach", {callback = _1_})
return nil
