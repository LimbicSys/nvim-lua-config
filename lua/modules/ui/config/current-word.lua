local augroup = require("easy-augroup")

require("illuminate").configure({
  delay = 500,
  filetypes_denylist = {
    'dirvish',
    'fugitive',
    "coc-explorer",
    "vista",
    "dashboard",
    "floaterm",
    "NvimTree",
    "lsputil_locations_list",
    "qf",
    "DiffviewFiles",
    "help",
    "NeogitStatus",
    "netrw",
    "",
  }
})

-- vim.g:Illuminate_highlightUnderCursor = 0

augroup.create_hl_group("Illuminate", {
  {
    name = "IlluminatedWordText",
    value = {
      fg = "#282a36",
      bg = "#d98e48",
    },
  },
  {
    name = "IlluminatedWordRead",
    value = {
      fg = "#282a36",
      bg = "#d98e48",
    },
  },
  {
    name = "IlluminatedWordTextWrite",
    value = {
      fg = "#282a36",
      bg = "#d98e48",
    },
  },
})

-- NOTE: should execute after colorscheme
-- vim.cmd([[ hi def link LspReferenceText illuminatedWord ]])
-- vim.cmd([[ hi def link LspReferenceWrite illuminatedWord  ]])
-- vim.cmd([[ hi def link LspReferenceRead illuminatedWord  ]])
