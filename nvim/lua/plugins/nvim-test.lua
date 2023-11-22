return {
  "klen/nvim-test",
  opts = {},
  config = function()
    require("nvim-test").setup({
      termOpts = {
        direction = "horizontal",
        height = 24,
        go_back = true,
      },
    })
  end,
}
