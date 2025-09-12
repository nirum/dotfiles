local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
keymap("", ";", ":", opts)
keymap("", ":", ";", opts)
keymap("n", "<CR>", ":noh<CR>", opts)
keymap("n", "<Esc>", ":noh<Esc>", opts)
keymap("n", "<tab>", ":tabnext<CR>", opts)
keymap("n", "<S-tab>", ":tabprevious<CR>", opts)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
return nil
