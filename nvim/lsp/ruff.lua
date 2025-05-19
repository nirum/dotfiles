return {
  -- Run the native server (no extra package needed)
  cmd = { "ruff", "server" },

  filetypes = { "python" },

  -- Let Ruff figure out the root from .git / pyproject / ruff.toml automatically.
  -- Add an explicit fallback so it still starts on single files.
  root_markers = {
    "pyproject.toml",
    "ruff.toml",
    ".ruff.toml",
    ".git",
  },

  -- Optional server-side tweaks
  init_options = {
    settings = {
      -- Example: only enforce Ruff’s formatter when you explicitly ask
      format = { enable = false },
      -- Example lint selection
      lint = { select = { "E", "F", "I", "UP", "B" } },
    },
  },
}
