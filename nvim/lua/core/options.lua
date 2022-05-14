-- options.lua
-- Author: Niru Maheswaranathan
-- Website: https://github.com/nirum/dotfiles

local options = {
  termguicolors = true,       -- User 24 bit color in the terminal.
  relativenumber = true,      -- Use relative line numbers.
  number = true,              -- Show the absolute number of the current line.
  clipboard = "unnamedplus",  -- Use system clipboard.
  gdefault = true,            -- Turn on global ("g" flag) for substitutions (:s//g).
  ignorecase = true,          -- Ignores case in search patterns.
  smartcase = true,           -- Override the ignorecase option if the search contains uppercase letters.
  splitright = true,          -- Position horizontal splits to the right.
  splitbelow = true,          -- Position vertical splits to the bottom.
  foldlevelstart = 99,        -- On start, open all folds.
  signcolumn = 'yes',         -- Always show the sign column.
  tabstop = 2,                -- Number of spaces a <Tab> counts for.
  shiftwidth = 2,             -- Number of spaces a <Tab> counts for.
  expandtab = true,           -- Replace <Tab> with spaces in insert mode.
  smartindent = false,        -- Try to be smart about indents on new lines.
  undofile = true,            -- Use an undo file.
  scrolloff = 8,              -- Padding when scrolling.
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  timeoutlen = 300,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
