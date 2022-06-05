local pydap = require('dap-python')
pydap.setup('~/miniconda3/bin/python')
pydap.test_runner = 'pytest'

-- keymaps
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")

vim.keymap.set("n", "<leader>d;", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<leader>dl", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<leader>dj", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<leader>dk", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.toggle()<CR>")

vim.keymap.set("n", "<leader>dn", ":lua require('dap-python').test_method()<CR>")
vim.keymap.set("n", "<leader>df", ":lua require('dap-python').test_class()<CR>")
vim.keymap.set("v", "<leader>ds", "<ESC>:lua require('dap-python').debug_selection()<CR>")

require("dap")
vim.fn.sign_define('DapBreakpoint', {text='🔧', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='🔨', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='🛑', texthl='', linehl='', numhl=''})

require("nvim-dap-virtual-text").setup()
