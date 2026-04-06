-- init.lua
-- Author: Niru Maheswaranathan
-- Website: https://github.com/nirum/dotfiles

require("options")
require("mappings")
require("lsp")
require("plugins")
require("statusline")

-- statusline
local function statusline()
  local mode_map = {
    n = "NORMAL",
    i = "INSERT",
    v = "VISUAL",
    V = "V-LINE",
    ["\22"] = "V-BLOCK",
    c = "CMD",
    s = "SELECT",
    S = "S-LINE",
    ["\19"] = "S-BLOCK",
    R = "REPLACE",
    r = "PROMPT",
    t = "TERM",
  }

  local mode = mode_map[vim.fn.mode()] or vim.fn.mode()
  local file = vim.fn.expand("%:~:.")
  if file == "" then file = "[No Name]" end

  local readonly = vim.bo.readonly and " RO" or ""
  local modified = vim.bo.modified and " [+]" or ""
  local ft = vim.bo.filetype ~= "" and vim.bo.filetype or "text"
  local enc = (vim.bo.fileencoding ~= "" and vim.bo.fileencoding) or vim.o.encoding
  local fmt = vim.bo.fileformat
  local diag = vim.diagnostic.status() -- built-in in 0.12
  local progress = vim.ui.progress_status() -- built-in in 0.12

  return table.concat({
    " ",
    mode,
    " │ ",
    file,
    readonly,
    modified,
    "%=", -- right align everything after this
    diag ~= "" and (diag .. " │ ") or "",
    progress ~= "" and (progress .. " │ ") or "",
    ft, " │ ",
    enc, "[", fmt, "]",
    " │ %l:%c ",
    "│ %p%% ",
  })
end

vim.o.statusline = "%!v:lua.Statusline()"
_G.Statusline = statusline

vim.api.nvim_create_autocmd({ "ModeChanged", "DiagnosticChanged", "LspProgress" }, {
  callback = function()
    vim.cmd.redrawstatus()
  end,
})
