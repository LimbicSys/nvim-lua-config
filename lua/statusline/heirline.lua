local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local colors = {
  rosewater = "#F2D5CF",
  flamingo = "#EEBEBE",
  pink = "#F4B8E4",
  mauve = "#CA9EE6",
  red = "#E78284",
  maroon = "#EA999C",
  peach = "#EF9F76",
  yellow = "#E5C890",
  green = "#A6D189",
  teal = "#81C8BE",
  sky = "#99D1DB",
  sapphire = "#85C1DC",
  blue = "#8CAAEE",
  lavender = "#BABBF1",

  text = "#C6D0F5",
  subtext1 = "#B5BFE2",
  subtext0 = "#A5ADCE",
  overlay2 = "#949CBB",
  overlay1 = "#838BA7",
  overlay0 = "#737994",
  surface2 = "#626880",
  surface1 = "#51576D",
  surface0 = "#414559",

  base = "#303446",
  mantle = "#292C3C",
  crust = "#232634",

  bg = "#292C3C",
}

require("heirline").load_colors(colors)

local Bar = {
  provider = "▊ ",
  hl = { fg = colors.blue, bg = colors.bg },
}

local ViMode = {
  -- get vim current mode, this information will be required by the provider
  -- and the highlight functions, so we compute it only once per component
  -- evaluation and store it as a component attribute
  init = function(self)
    self.mode = vim.fn.mode(1) -- :h mode()

    -- execute this only once, this is required if you want the ViMode
    -- component to be updated on operator pending mode
    if not self.once then
      vim.api.nvim_create_autocmd("ModeChanged", { command = "redrawstatus" })
      self.once = true
    end
  end,
  -- Now we define some dictionaries to map the output of mode() to the
  -- corresponding string and color. We can put these into `static` to compute
  -- them at initialisation time.
  static = {
    mode_names = { -- change the strings if you like it vvvvverbose!
      n = "N",
      no = "N?",
      nov = "N?",
      noV = "N?",
      ["no\22"] = "N?",
      niI = "Ni",
      niR = "Nr",
      niV = "Nv",
      nt = "Nt",
      v = "V",
      vs = "Vs",
      V = "V_",
      Vs = "Vs",
      ["\22"] = "^V",
      ["\22s"] = "^V",
      s = "S",
      S = "S_",
      ["\19"] = "^S",
      i = "I",
      ic = "Ic",
      ix = "Ix",
      R = "R",
      Rc = "Rc",
      Rx = "Rx",
      Rv = "Rv",
      Rvc = "Rv",
      Rvx = "Rv",
      c = "C",
      cv = "Ex",
      r = "...",
      rm = "M",
      ["r?"] = "?",
      ["!"] = "!",
      t = "T",
    },
    mode_colors = {
      n = "red",
      i = "teal",
      v = "sky",
      V = "sky",
      ["\22"] = "sky",
      c = "peach",
      s = "mauve",
      S = "mauve",
      ["\19"] = "mauve",
      R = "peach",
      r = "peach",
      ["!"] = "red",
      t = "red",
    },
  },
  -- We can now access the value of mode() that, by now, would have been
  -- computed by `init()` and use it to index our strings dictionary.
  -- note how `static` fields become just regular attributes once the
  -- component is instantiated.
  -- To be extra meticulous, we can also add some vim statusline syntax to
  -- control the padding and make sure our string is always at least 2
  -- characters long. Plus a nice Icon.
  provider = function(self)
    return "<" .. self.mode_names[self.mode] .. ">"
  end,
  -- Same goes for the highlight. Now the foreground will change according to the current mode.
  hl = function(self)
    local mode = self.mode:sub(1, 1) -- get only the first mode character
    return { fg = self.mode_colors[mode], bg = colors.bg, bold = true }
  end,
  -- Re-evaluate the component only on ModeChanged event!
  -- This is not required in any way, but it's there, and it's a small
  -- performance improvement.
  update = "ModeChanged",
}

local FileName = {
  provider = "%t%r%m",
  hl = {
    fg = colors.green,
    bg = colors.bg,
  },
}

LineInfo = {
  provider = "%l:%c",
  hl = {
    fg = colors.yellow,
    bg = colors.bg,
  },
}

Percent = {
  provider = "%p%%",
  hl = {
    fg = colors.teal,
    bg = colors.bg,
  },
}

local FileType = {
  provider = function()
    if vim.bo.filetype == "" then
      return string.upper(vim.bo.buftype)
    end
    return string.upper(vim.bo.filetype)
  end,
  hl = { fg = colors.blue, bg = colors.bg, bold = true },
}

local FileEncoding = {
  provider = function()
    local enc = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc -- :h 'enc'
    return enc ~= "utf-8" and enc:upper()
  end,
}

local FileFormat = {
  provider = function()
    local fmt = vim.bo.fileformat
    return fmt ~= "unix" and fmt:upper()
  end,
}

local HelpFileName = {
  condition = function()
    return vim.bo.filetype == "help"
  end,
  provider = function()
    local filename = vim.api.nvim_buf_get_name(0)
    return vim.fn.fnamemodify(filename, ":t")
  end,
  hl = { fg = colors.blue },
}

local Git = {
  condition = conditions.is_git_repo,

  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,

  hl = { fg = colors.peach, bg = colors.bg },

  { -- git branch name
    provider = function(self)
      return "@" .. self.status_dict.head
    end,
    hl = { bold = true },
  },
  -- You could handle delimiters, icons and counts similar to Diagnostics
  {
    provider = function(self)
      local count = self.status_dict.added or 0
      return count > 0 and (" +" .. count)
    end,
    hl = { fg = colors.green },
  },
  {
    provider = function(self)
      local count = self.status_dict.removed or 0
      return count > 0 and (" -" .. count)
    end,
    hl = { fg = colors.red },
  },
  {
    provider = function(self)
      local count = self.status_dict.changed or 0
      return count > 0 and (" ~" .. count)
    end,
    hl = { fg = colors.peach },
  },
}

local TerminalName = {
  -- we could add a condition to check that buftype == 'terminal'
  -- or we could do that later (see #conditional-statuslines below)
  provider = function()
    local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*:", "")
    return tname
  end,
  hl = { fg = "blue", bold = true },
}

local Navic = {
  condition = require("nvim-navic").is_available,
  init = function(self)
    local data = require("nvim-navic").get_data() or {}
    local children = {}
    -- create a child for each level
    for i, d in ipairs(data) do
      local child = {
        {
          provider = d.name,
        },
      }
      -- add a separator only if needed
      if #data > 1 and i < #data then
        table.insert(child, {
          provider = " > ",
        })
      end
      table.insert(children, child)
    end
    -- instantiate the new child
    self[1] = self:new(children, 1)
  end,
}

Navic = utils.make_flexible_component(1, Navic, { provider = "" })

local Align = {
  provider = "%=",
  hl = {
    bg = colors.bg,
  },
}

local Space = {
  provider = " ",
  hl = {
    bg = colors.bg,
  },
}

local DefaultStatusline = {
  Bar,
  Space,
  ViMode,
  Space,
  FileName,
  Space,
  LineInfo,
  Space,
  Percent,
  Align,
  Navic,
  Align,
  FileType,
  Space,
  FileEncoding,
  Space,
  FileFormat,
  Space,
  Git,
  Space,
}

local InactiveStatusline = {
  condition = function()
    return not conditions.is_active()
  end,

  Bar,
  Space,
  FileType,
  Space,
  FileName,
  Align,
}

local SpecialStatusline = {
  condition = function()
    return conditions.buffer_matches({
      buftype = { "nofile", "prompt", "help", "quickfix", "terminal" },
      filetype = {
        "^git.*",
        "fugitive",
        "NvimTree",
        "vista",
        "dbui",
        "coc-explorer",
        "VimspectorPrompt",
        "DiffviewFiles",
        "vim-plug",
        "spectre_panel",
        "NeogitStatus",
        "NeogitCommitView",
        "netrw",
      },
    })
  end,

  Bar,
  Space,
  FileType,
  Space,
  HelpFileName,
  Align,
}

local TerminalStatusline = {
  condition = function()
    return conditions.buffer_matches({ buftype = { "terminal" } })
  end,

  Bar,
  Space,
  -- Quickly add a condition to the ViMode to only show it when buffer is active!
  { condition = conditions.is_active, ViMode, Space },
  FileType,
  Space,
  TerminalName,
  Align,
}

local StatusLines = {

  hl = function()
    if conditions.is_active() then
      return "StatusLine"
    else
      return "StatusLineNC"
    end
  end,

  fallthrough = false,

  SpecialStatusline,
  TerminalStatusline,
  InactiveStatusline,
  DefaultStatusline,
}

require("heirline").setup(StatusLines)
