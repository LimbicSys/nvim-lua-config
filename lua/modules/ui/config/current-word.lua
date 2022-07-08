local augroup = require("easy-augroup")

vim.g.Illuminate_ftblacklist = {
  "coc-explorer",
  "vista",
  "dashboard",
  "floaterm",
  "NvimTree",
  "lsputil_locations_list",
  "qf",
  "DiffviewFiles",
  "help",
  "",
}

vim.g.Illuminate_delay = 500
-- vim.g:Illuminate_highlightUnderCursor = 0

augroup.create_hl_group("Illuminate", {
  {
    name = "illuminatedWord",
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
