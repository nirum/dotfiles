-- User 24 bit color in the terminal.
vim.opt.termguicolors = true

-- Use relative line numbers.
vim.opt.relativenumber = true

-- Show the absolute number of the current line.
vim.opt.number = true

-- Use system clipboard.
vim.opt.clipboard = "unnamedplus"

-- Turn on global ("g" flag) for substitutions (:s//g).
vim.opt.gdefault = true

-- Ignores case in search patterns.
vim.opt.ignorecase = true

-- Override the ignorecase option if the search contains uppercase letters.
vim.opt.smartcase = true

-- Position splits to the right and below for vertical and regular splits.
vim.opt.splitright = true
vim.opt.splitbelow = true

-- On start, open all folds.
vim.opt.foldlevelstart = 99

-- Always show the sign column.
vim.opt.signcolumn = 'yes'

-- Number of spaces a <Tab> counts for.
-- vim.opt.tabstop = 2
-- vim.opt.shiftwidth = 2

-- Replace <Tab> with spaces in insert mode.
vim.opt.expandtab = true

-- Try to be smart about indents on new lines.
vim.opt.smartindent = false

-- Use an undo file.
vim.opt.undofile = true
