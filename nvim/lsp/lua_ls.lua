return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  diagnostics = {
    globals = { "vim" },
  },
  root_markers = {
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    "selene.yml",
    ".git",
  }
}
