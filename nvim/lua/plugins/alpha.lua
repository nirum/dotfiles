return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[
                       _           
 _ __   ___  _____   _(_)_ __ ___  
| '_ \ / _ \/ _ \ \ / / | '_ ` _ \ 
| | | |  __/ (_) \ V /| | | | | | |
|_| |_|\___|\___/ \_/ |_|_| |_| |_|

]]
      local function getGreeting()
        local tableTime = os.date("*t")
        local datetime = os.date(" %Y-%m-%d   %I:%M %p")
        local hour = tableTime.hour
        return "\t\t\t" .. datetime
      end

      local greeting = getGreeting()
      dashboard.section.header.val = vim.split(logo .. "\n" .. greeting, "\n")
      dashboard.section.buttons.val = {
        dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("l", "⚡︎" .. " Lazy", ":Lazy<CR>"),
        dashboard.button("m", "⚙︎ " .. " Mason", ":Mason<CR>"),
        dashboard.button("q", " " .. " Quit", ":qa<CR>"),
      }
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.opts.layout[1].val = 6
      return dashboard
    end,
    config = function(_, dashboard)
      require("alpha").setup(dashboard.opts)
      vim.api.nvim_create_autocmd("User", {
        callback = function()
          local stats = require("lazy").stats()
          local ms = math.floor(stats.startuptime * 100) / 100
          dashboard.section.footer.val = "⚡︎Lazy-loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },
}
