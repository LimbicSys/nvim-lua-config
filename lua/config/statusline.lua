require("zephyr")
vim.api.nvim_command("colorscheme zephyr")

local gl = require("galaxyline")
local gls = gl.section
gl.short_line_list = {"NvimTree", "vista", "dbui", "coc-explorer", "VimspectorPrompt", "DiffviewFiles", "vim-plug"}
gls.left = {}
gls.right = {}
gls.short_line_left = {}
gls.short_line_right = {}

local colors = {
  bg = "#202328",
  fg = "#bbc2cf",
  yellow = "#fabd2f",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67",
  purple = "#5d4d7a"
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
    return true
  end
  return false
end

table.insert(
  gls.left,
  {
    RainbowRed = {
      provider = function()
        return "▊ "
      end,
      highlight = {colors.blue, colors.bg}
    }
  }
)

table.insert(
  gls.left,
  {
    ViMode = {
      -- icon = function()
      --   local icons = {
      --     n = " ",
      --     i = "פֿ ",
      --     c = "ﲵ ",
      --     V = " ",
      --     [""] = " ",
      --     v = " ",
      --     C = "ﲵ ",
      --     R = "﯒",
      --     t = " "
      --   }
      --   return icons[vim.fn.mode()]
      -- end,
      provider = function()
        -- auto change color according the vim mode
        local alias = {
          n = "N",
          i = "I",
          c = "C",
          V = "VL",
          [""] = "V",
          v = "V",
          C = "C",
          ["r?"] = ":CONFIRM",
          rm = "--MORE",
          R = "R",
          Rv = "R&V",
          s = "S",
          S = "S",
          ["r"] = "HIT-ENTER",
          [""] = "SELECT",
          t = "T",
          ["!"] = "SH"
        }

        local vim_mode = vim.fn.mode()
        local mode_color = {
          n = colors.magenta,
          i = colors.green,
          v = colors.blue,
          [""] = colors.blue,
          V = colors.blue,
          c = colors.red,
          no = colors.magenta,
          s = colors.orange,
          S = colors.orange,
          [""] = colors.orange,
          ic = colors.yellow,
          R = colors.purple,
          Rv = colors.purple,
          cv = colors.red,
          ce = colors.red,
          r = colors.cyan,
          rm = colors.cyan,
          ["r?"] = colors.cyan,
          ["!"] = colors.red,
          t = colors.red
        }
        vim.api.nvim_command("hi galaxyvimode guifg=" .. mode_color[vim_mode])
        return alias[vim_mode]
      end,
      highlight = {colors.red, colors.bg, "bold"},
      separator = " ",
      separator_highlight = {"NONE", colors.bg}
    }
  }
)

-- table.insert(
--   gls.left,
--   {
--     FileSize = {
--       provider = "FileSize",
--       condition = buffer_not_empty,
--       highlight = {colors.fg, colors.bg}
--     }
--   }
-- )

table.insert(
  gls.left,
  {
    FileIcon = {
      provider = "FileIcon",
      condition = buffer_not_empty,
      highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, colors.bg}
    }
  }
)

table.insert(
  gls.left,
  {
    FileName = {
      provider = function()
        return "%t "
      end,
      condition = buffer_not_empty,
      highlight = {colors.green, colors.bg, "bold"}
    }
  }
)

table.insert(
  gls.left,
  {
    LineInfo = {
      provider = function()
        return "%l:%c"
      end,
      separator = " ",
      separator_highlight = {"NONE", colors.bg},
      highlight = {colors.fg, colors.bg}
    }
  }
)

table.insert(
  gls.left,
  {
    PerCent = {
      provider = function()
        return "%p%%"
      end,
      separator = " ",
      separator_highlight = {"NONE", colors.bg},
      highlight = {colors.fg, colors.bg, "bold"}
    }
  }
)

-- table.insert(
--   gls.left,
--   {
--     DiagnosticError = {
--       provider = "DiagnosticError",
--       icon = " ",
--       separator = " ",
--       separator_highlight = {"NONE", colors.bg},
--       highlight = {colors.red, colors.bg}
--     }
--   }
-- )

-- table.insert(
--   gls.left,
--   {
--     DiagnosticWarn = {
--       provider = "DiagnosticWarn",
--       icon = " ",
--       separator = " ",
--       separator_highlight = {"NONE", colors.bg},
--       highlight = {colors.yellow, colors.bg}
--     }
--   }
-- )

-- table.insert(
--   gls.left,
--   {
--     DiagnosticHint = {
--       provider = "DiagnosticHint",
--       icon = " ",
--       separator = " ",
--       separator_highlight = {"NONE", colors.bg},
--       highlight = {colors.cyan, colors.bg}
--     }
--   }
-- )

-- table.insert(
--   gls.left,
--   {
--     DiagnosticInfo = {
--       provider = "DiagnosticInfo",
--       icon = " ",
--       separator = " ",
--       separator_highlight = {"NONE", colors.bg},
--       highlight = {colors.blue, colors.bg}
--     }
--   }
-- )

table.insert(
  gls.left,
  {
    NearestInfo = {
      -- provider = function()
      --     require('lsp-status').update_current_function()
      --     return vim.b.lsp_current_function
      -- end,
      provider = function()
        -- return vim.fn.get("b:", "vista_nearest_method_or_function")
        if vim.b.vista_nearest_method_or_function ~= nil then
          return vim.b.vista_nearest_method_or_function
        else
          return ""
        end
      end,
      condition = function()
        local tbl = {["dashboard"] = true, [""] = true}
        if tbl[vim.bo.filetype] then
          return false
        end
        return true
      end,
      icon = ": ",
      highlight = {colors.blue, colors.bg}
    }
  }
)

table.insert(
  gls.right,
  {
    TabWidth = {
      provider = function()
        return "TabSize: " .. vim.bo.tabstop
      end,
      separator = " ",
      separator_highlight = {"NONE", colors.bg},
      highlight = {colors.green, colors.bg, "bold"}
    }
  }
)

table.insert(
  gls.right,
  {
    FileEncode = {
      provider = "FileEncode",
      separator = " ",
      separator_highlight = {"NONE", colors.bg},
      highlight = {colors.green, colors.bg, "bold"}
    }
  }
)

table.insert(
  gls.right,
  {
    FileFormat = {
      provider = "FileFormat",
      separator = " ",
      separator_highlight = {"NONE", colors.bg},
      highlight = {colors.green, colors.bg, "bold"}
    }
  }
)

table.insert(
  gls.right,
  {
    GitIcon = {
      provider = function()
        return "  "
      end,
      condition = require("galaxyline.provider_vcs").check_git_workspace,
      separator = " ",
      separator_highlight = {"NONE", colors.bg},
      highlight = {colors.violet, colors.bg, "bold"}
    }
  }
)

table.insert(
  gls.right,
  {
    GitBranch = {
      provider = "GitBranch",
      condition = require("galaxyline.provider_vcs").check_git_workspace,
      highlight = {colors.violet, colors.bg, "bold"}
    }
  }
)

local checkwidth = function()
  local squeeze_width = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

-- table.insert(
--   gls.right,
--   {
--     DiffAdd = {
--       provider = "DiffAdd",
--       condition = checkwidth,
--       icon = " ",
--       highlight = {colors.green, colors.bg},
--       separator = " ",
--       separator_highlight = {"NONE", colors.bg}
--     }
--   }
-- )

-- table.insert(
--   gls.right,
--   {
--     DiffModified = {
--       provider = "DiffModified",
--       condition = checkwidth,
--       icon = "  ",
--       highlight = {colors.orange, colors.bg}
--     }
--   }
-- )

-- table.insert(
--   gls.right,
--   {
--     DiffRemove = {
--       provider = "DiffRemove",
--       condition = checkwidth,
--       icon = "  ",
--       highlight = {colors.red, colors.bg}
--     }
--   }
-- )

table.insert(
  gls.right,
  {
    RainbowBlue = {
      provider = function()
        return " ▊"
      end,
      highlight = {colors.blue, colors.bg},
      separator = " ",
      separator_highlight = {"NONE", colors.bg}
    }
  }
)

table.insert(
  gls.short_line_left,
  {
    BufferType = {
      provider = "FileTypeName",
      separator = " ",
      separator_highlight = {"NONE", colors.bg},
      highlight = {colors.blue, colors.bg, "bold"}
    }
  }
)

table.insert(
  gls.short_line_left,
  {
    SFileName = {
      provider = function()
        local fileinfo = require("galaxyline.provider_fileinfo")
        local fname = fileinfo.get_current_file_name()
        for _, v in ipairs(gl.short_line_list) do
          if v == vim.bo.filetype then
            return ""
          end
        end
        return fname
      end,
      condition = buffer_not_empty,
      highlight = {colors.white, colors.bg, "bold"}
    }
  }
)

table.insert(
  gls.short_line_right,
  {
    BufferIcon = {
      provider = "BufferIcon",
      highlight = {colors.fg, colors.bg}
    }
  }
)
