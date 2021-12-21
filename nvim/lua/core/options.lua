o = vim.opt

-- User 24 bit color in the terminal.
o.termguicolors = true

-- Use relative line numbers.
o.relativenumber = true

-- Show the absolute number of the current line.
o.number = true

-- Use system clipboard.
o.clipboard = "unnamedplus"

-- Turn on global ("g" flag) for substitutions (:s//g).
o.gdefault = true

-- Ignores case in search patterns.
o.ignorecase = true

-- Override the ignorecase option if the search contains uppercase letters.
o.smartcase = true

-- Position splits to the right and below for vertical and regular splits.
o.splitright = true
o.splitbelow = true

-- On start, open all folds.
o.foldlevelstart = 99

-- Always show the sign column.
o.signcolumn = 'yes'

-- Number of spaces a <Tab> counts for.
o.tabstop = 2
o.shiftwidth = 2

-- Replace <Tab> with spaces in insert mode.
o.expandtab = true

-- Try to be smart about indents on new lines.
o.smartindent = false

-- Use an undo file.
o.undofile = true
