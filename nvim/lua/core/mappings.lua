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

-- Format (Neoformat)
keymap("n", "<leader>f", ":Neoformat <CR>", opts)
vim.cmd([[
  let g:neoformat_python_ufmt = {'exe': 'ufmt', 'args': ['format'], 'replace': 1}
  let g:neoformat_python_tidy = {'exe': 'tidy-imports', 'args': ['--black', '--quiet', '--replace-star-imports', '--action REPLACE'], 'replace': 1}
  let g:neoformat_enabled_python = ['tidy', 'ufmt']
  let g:neoformat_run_all_formatters = 1
  let g:neoformat_only_msg_on_error = 0
]])

-- Telescope
keymap(
	"n",
	"f",
	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
	opts
)
keymap("n", "s", "<cmd>Telescope live_grep<cr>", opts)

-- Magma
vim.cmd([[
  " nnoremap <silent><expr> <LocalLeader>r  :MagmaEvaluateOperator<CR>
  nnoremap <silent> <leader><Enter> :MagmaEvaluateLine<CR>
  xnoremap <silent> <leader>r  :<C-u>MagmaEvaluateVisual<CR>
  nnoremap <silent> <leader>rc :MagmaReevaluateCell<CR>
  nnoremap <silent> <leader>rd :MagmaDelete<CR>
  nnoremap <silent> <leader>o :MagmaShowOutput<CR>
  nnoremap <silent> <leader>i :MagmaInit python3<CR>

  let g:magma_automatically_open_output = v:false
  let g:magma_image_provider = "kitty"
]])
