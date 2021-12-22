o = vim.opt

local options = {
  o.termguicolors = true        -- User 24 bit color in the terminal.
  o.relativenumber = true       -- Use relative line numbers.
  o.number = true               -- Show the absolute number of the current line.
  o.clipboard = "unnamedplus"   -- Use system clipboard.
  o.gdefault = true             -- Turn on global ("g" flag) for substitutions (:s//g).
  o.ignorecase = true           -- Ignores case in search patterns.
  o.smartcase = true            -- Override the ignorecase option if the search contains uppercase letters.
  o.splitright = true           -- Position horizontal splits to the right.
  o.splitbelow = true           -- Position vertical splits to the bottom.
  o.foldlevelstart = 99         -- On start, open all folds.
  o.signcolumn = 'yes'          -- Always show the sign column.
  o.tabstop = 2                 -- Number of spaces a <Tab> counts for.
  o.shiftwidth = 2              -- Number of spaces a <Tab> counts for.
  o.expandtab = true            -- Replace <Tab> with spaces in insert mode.
  o.smartindent = false         -- Try to be smart about indents on new lines.
  o.undofile = true             -- Use an undo file.
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
