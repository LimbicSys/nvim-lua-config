vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_filetype_exclude = {
  "help",
  "dashboard",
  "dashpreview",
  "LuaTree",
  "vista",
  "sagahover",
  "coc-explorer",
  "lspinfo",
  "lsputil_locations_list",
  "floaterm",
  "DiffviewFiles",
  "NvimTree",
  "vim",
  -- "lua",
  "packer",
}
vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_char = "│"
vim.g.indent_blankline_show_trailing_blankline_indent = false
