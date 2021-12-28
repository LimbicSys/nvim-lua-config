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

vim.cmd([[
  augroup illuminate_augroup
      autocmd!
      autocmd VimEnter * hi illuminatedWord cterm=underline guifg=#282a36 guibg=#d98e48
  augroup END
]])
