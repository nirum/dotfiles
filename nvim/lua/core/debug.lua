-- require('dap').setup()

local pydap = require('dap-python')
pydap.setup('~/miniconda3/envs/ctrldev/bin/python')
pydap.test_runner = 'pytest'

-- keymaps
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")

vim.keymap.set("n", "<leader>d;", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<leader>dl", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<leader>dj", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<leader>dk", ":lua require'dap'.step_out()<CR>")

vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<leader>dn", ":lua require('dap-python').test_method()<CR>")
vim.keymap.set("n", "<leader>df", ":lua require('dap-python').test_class()<CR>")
vim.keymap.set("v", "<leader>ds", "<ESC>:lua require('dap-python').debug_selection()<CR>")
vim.keymap.set("n", "<leader>do", ":lua require('dapui').open()<CR>")
vim.keymap.set("n", "<leader>dc", ":lua require('dapui').close()<CR>")

require("nvim-dap-virtual-text").setup()
require("dapui").setup()

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
