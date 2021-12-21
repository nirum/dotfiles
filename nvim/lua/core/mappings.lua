-- Shorthand.
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Remap space as leader key.
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Swap colon and semicolon.
keymap('', ';', ':', opts)
keymap('', ':', ';', opts)

-- Clear highlighting..
keymap('n', '<CR>', ':noh<CR>', opts)
keymap('n', '<Esc>', ':noh<Esc>', opts)

-- Tab navigation.
keymap('n', '<tab>', ':tabnext<CR>', opts)
keymap('n', '<S-tab>', ':tabprevious<CR>', opts)

-- Visual mode persistent indenting.
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Move text up and down when visually selected.
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
