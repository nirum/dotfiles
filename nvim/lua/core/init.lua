-- if vim.loader then
  -- vim.loader.enable()
-- end

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("core.options")
require("core.mappings")
require("core.plugins")
