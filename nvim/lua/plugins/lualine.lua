local colors = require("tokyonight.colors").setup({ transform = true })
local config = require("tokyonight.config").options

local tokyonight = {}

tokyonight.normal = {
  a = { bg = colors.blue, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.blue },
  c = { fg = colors.fg_sidebar },
}

tokyonight.insert = {
  a = { bg = colors.green, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.green },
}

tokyonight.command = {
  a = { bg = colors.yellow, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.yellow },
}

tokyonight.visual = {
  a = { bg = colors.magenta, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.magenta },
}

tokyonight.replace = {
  a = { bg = colors.red, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.red },
}

tokyonight.terminal = {
  a = { bg = colors.green1, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.green1 },
}

tokyonight.inactive = {
  a = { bg = colors.bg_statusline, fg = colors.blue },
  b = { bg = colors.bg_statusline, fg = colors.fg_gutter, gui = "bold" },
  c = { bg = colors.bg_statusline, fg = colors.fg_gutter },
}

if config.lualine_bold then
  for _, mode in pairs(tokyonight) do
    mode.a.gui = "bold"
  end
end

-- Set lualine as statusline
return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local mode = {
      "mode",
      fmt = function(str)
        local cases = {
          NORMAL = "󰫻 ",
          INSERT = "󰫶 ",
          VISUAL = "󰬃 ",
          ["V-LINE"] = "󰬃 ",
        }

        return cases[str] or str
      end,
    }

    local filename = {
      "filename",
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
      symbols = {
        modified = " ", -- Text to show when the file is modified.
        readonly = " ", -- Text to show when the file is non-modifiable or readonly.
        unnamed = "", -- Text to show for unnamed buffers.
        newfile = " ", -- Text to show for newly created file before first write
      },
    }

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100
    end

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn" },
      symbols = { error = " ", warn = " ", info = " ", hint = " " },
      colored = false,
      update_in_insert = false,
      always_visible = false,
      cond = hide_in_width,
    }

    local diff = {
      "diff",
      colored = false,
      symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
      cond = hide_in_width,
    }

    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = tokyonight, -- Set theme based on environment variable
        -- Some useful glyphs:
        -- https://www.nerdfonts.com/cheat-sheet
        --        
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "neo-tree" },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { "branch" },
        lualine_c = { filename },
        lualine_x = { diagnostics, diff, { "encoding", cond = hide_in_width }, { "filetype", cond = hide_in_width } },
        lualine_y = { "location" },
        lualine_z = { "progress" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { { "location", padding = 0 } },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { "fugitive" },
    })
  end,
}
