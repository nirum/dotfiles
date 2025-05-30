local opt = vim.opt

opt.termguicolors = true        -- User 24 bit color in the terminal.
opt.relativenumber = true       -- Use relative line numbers.
opt.number = true               -- Show the absolute number of the current line.
opt.clipboard = "unnamedplus"   -- Use system clipboard.
opt.gdefault = true             -- Turn on global ("g" flag) for substitutions (:s//g).
opt.ignorecase = true           -- Ignores case in search patterns.
opt.smartcase = true            -- Override the ignorecase option if the search contains uppercase letters.
opt.splitright = true           -- Position horizontal splits to the right.
opt.splitbelow = true           -- Position vertical splits to the bottom.
opt.foldmethod = "indent"       -- Fold using indents.
opt.foldlevelstart = 99         -- On start, open all folds.
opt.signcolumn = 'yes'          -- Always show the sign column.
opt.tabstop = 2                 -- Number of spaces a <Tab> counts for.
opt.shiftwidth = 2              -- Number of spaces a <Tab> counts for.
opt.expandtab = true            -- Replace <Tab> with spaces in insert mode.
opt.autoindent = true           -- Automatically indent when adding a new line.
opt.smartindent = true          -- Try to be smart about indents on new lines.
opt.undofile = true             -- Use an undo file.
opt.scrolloff = 8               -- Padding when scrolling.
opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
opt.timeoutlen = 500            -- Time in milliseconds to wait for a mapped sequence to complete.
opt.updatetime = 1000           -- 
opt.laststatus = 3              -- global statusline
-- opt.winborder = "rounded"       -- rounded borders in floating windows

vim.diagnostic.config({ virtual_lines = { current_line = true } })
