return {
  -- If you keep Pyrefly inside a uv venv, use:
  -- cmd = { "uv", "run", "pyrefly", "lsp" },
  cmd = { "pyrefly", "lsp" },

  filetypes    = { "python" },

  -- Minimal project detection: pyproject, .git, or the user’s home dir
  root_markers = { "pyproject.toml", ".git", "pyrefly.toml" },

  -- Handy notification when the LS exits
  on_exit = function(code)
    vim.notify(
      ("Pyrefly LSP exited with code %d"):format(code),
      vim.log.levels.INFO
    )
  end,
}
