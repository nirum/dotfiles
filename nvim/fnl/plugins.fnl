(local add vim.pack.add)
(local keymap vim.keymap.set)

; Colorscheme
(add ["https://github.com/webhooked/kanso.nvim"])
((. (require "kanso") :setup) {:compile true :transparent true})
(vim.cmd "colorscheme kanso")

; Picker
(add ["https://github.com/ibhagwan/fzf-lua"])
(keymap "n" "f"
  (fn []
    ((. (require "fzf-lua") :files)))
  opts)

; Treesitter
(add ["https://github.com/nvim-treesitter/nvim-treesitter"])
((. (require "nvim-treesitter.configs") :setup)
  {:highlight {:enable true}
   :indent {:enable true}
   :ensure_installed
    ["json" "javascript" "typescript" "fennel" "tsx" "go" "yaml" "toml" "html" "css" "python" "haskell" "cpp" "markdown" "markdown_inline" "graphql" "make" "cmake" "bash" "lua" "vim" "vimdoc" "dockerfile" "gitignore" "query" "kdl"]})

; Indent blanklines
(add ["https://github.com/lukas-reineke/indent-blankline.nvim"])
((. (require "ibl") :setup))

nil
