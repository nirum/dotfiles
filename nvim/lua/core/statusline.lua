local icons = require("nvim-nonicons")
icons.get("file")

local codicons = require("codicons")
codicons.setup()

local lualine = require("lualine")
lualine.setup({})

local tabline = require("tabline")
tabline.setup()

require("nvim-tree").setup()
