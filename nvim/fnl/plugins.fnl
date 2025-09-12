(local add vim.pack.add)

; Colorscheme
(add ["https://github.com/webhooked/kanso.nvim"])
((. (require "kanso") :setup) {:compile true :transparent true})
(vim.cmd "colorscheme kanso")

nil
