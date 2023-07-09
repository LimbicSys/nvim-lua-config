require("lspsaga").setup({
  lightbulb = {
    sign = true,
    virtual_text = false,
    enable_in_insert = false,
  },
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    quit = "<Esc>",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>", -- quit can be a table
  },
  code_action_keys = {
    quit = "<Esc>",
    exec = "<CR>",
  },
  symbol_in_winbar = {
    enable = true,
    show_file = true,
  },
})

local opt = { silent = true, noremap = true }
vim.keymap.set("n", "<leader>dd", "<CMD>Lspsaga show_line_diagnostics<CR>", opt)

require("easy-augroup").create_hl_group("LspSagaHighLight", {
  {
    name = "LspSagaLightBulb",
    value = {
      fg = "#81C8BE",
    },
  },
})
