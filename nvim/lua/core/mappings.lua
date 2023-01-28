-- mappings.lua
-- Author: Niru Maheswaranathan
-- Website: https://github.com/nirum/dotfiles

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Remap space as leader key.
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Swap colon and semicolon.
keymap("", ";", ":", opts)
keymap("", ":", ";", opts)

-- Clear highlighting..
keymap("n", "<CR>", ":noh<CR>", opts)
keymap("n", "<Esc>", ":noh<Esc>", opts)

-- Tab navigation.
keymap("n", "<tab>", ":tabnext<CR>", opts)
keymap("n", "<S-tab>", ":tabprevious<CR>", opts)

-- Visual mode persistent indenting.
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down when visually selected.
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Diagnostic keymaps
vim.keymap.set("n", "?", vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Format (Neoformat)
keymap("n", "<leader>f", ":Neoformat <CR>", opts)
vim.cmd([[
  let g:neoformat_python_pyfmt = {'exe': 'pyfmt', 'replace': 1}
  let g:neoformat_enabled_python = ['pyfmt']
  let g:neoformat_run_all_formatters = 1
  let g:neoformat_only_msg_on_error = 0
]])

