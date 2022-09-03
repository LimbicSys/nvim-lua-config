local augroup = require("easy-augroup")

require("illuminate").configure({
  delay = 500,
  filetypes_denylist = {
    "dirvish",
    "fugitive",
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
    "packer",
    "",
  },
})

-- vim.g:Illuminate_highlightUnderCursor = 0

local color_value = {
  -- fg = "#282a36",
  bg = "#52576e",
}
augroup.create_hl_group("Illuminate", {
  {
    name = "IlluminatedWordText",
    value = color_value,
  },
  {
    name = "IlluminatedWordRead",
    value = color_value,
  },
  {
    name = "IlluminatedWordWrite",
    value = color_value,
  },
})

-- NOTE: should execute after colorscheme
-- vim.cmd([[ hi def link LspReferenceText illuminatedWord ]])
-- vim.cmd([[ hi def link LspReferenceWrite illuminatedWord  ]])
-- vim.cmd([[ hi def link LspReferenceRead illuminatedWord  ]])
