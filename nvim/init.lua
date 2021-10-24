vim.o.termguicolors = true
vim.cmd([[
  runtime ./plug.vim
  runtime ./settings.lua
]])
-- require 'settings.lua'

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.clipboard:append { "unnamedplus" }
vim.opt.gdefault = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.foldlevelstart = 99
vim.opt.signcolumn = 'yes'

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.undofile = true
vim.opt.undodir:append { "~/.vim-undo" }

local key_mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
  )
end

key_mapper('', ';', ':')
key_mapper('', ':', ';')

key_mapper('n', '<CR>', ':noh<CR>')
key_mapper('n', '<Esc>', ':noh<Esc>')
key_mapper('n', '<tab>', ':next<CR>')
key_mapper('n', '<S-tab>', ':previous<CR>')

key_mapper('i', '<', '<gv')
key_mapper('i', '>', '>gv')

vim.cmd([[
  nnoremap <silent> f <cmd>Telescope find_files<CR>
  nnoremap <silent> s <cmd>Telescope live_grep<CR>

  let g:neoformat_enabled_python = ['yapf']
  augroup autofmt
    autocmd!
    autocmd BufWritePre * Neoformat
  augroup END

  let g:indent_blankline_char = ''
  let g:indent_blankline_use_treesitter = v:true
]])
