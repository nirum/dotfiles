return {
  "williamboman/mason.nvim",

  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    -- "WhoIsSethDaniel/mason-tool-installer.nvim",
  },

  config = function()
    local mason = require("mason")
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({})
  end,
}
