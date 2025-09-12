local add = vim.pack.add
local keymap = vim.keymap.set
add({"https://github.com/webhooked/kanso.nvim"})
require("kanso").setup({compile = true, transparent = true})
vim.cmd("colorscheme kanso")
add({"https://github.com/ibhagwan/fzf-lua"})
local function _1_()
  return require("fzf-lua").files()
end
keymap("n", "f", _1_, opts)
add({"https://github.com/nvim-treesitter/nvim-treesitter"})
require("nvim-treesitter.configs").setup({highlight = {enable = true}, indent = {enable = true}, ensure_installed = {"json", "javascript", "typescript", "fennel", "tsx", "go", "yaml", "toml", "html", "css", "python", "haskell", "cpp", "markdown", "markdown_inline", "graphql", "make", "cmake", "bash", "lua", "vim", "vimdoc", "dockerfile", "gitignore", "query", "kdl"}})
add({"https://github.com/lukas-reineke/indent-blankline.nvim"})
return nil
