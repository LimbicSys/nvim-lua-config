require("lspsaga").init_lsp_saga({
  code_action_lightbulb = {
    sign = true,
    virtual_text = false,
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
})

local opt = { silent = true, noremap = true }
vim.keymap.set("n", "<leader>dd", require("lspsaga.diagnostic").show_line_diagnostics, opt)

require("easy-augroup").create_hl_group("LspSagaHighLight", {
  {
    name = "LspSagaLightBulb",
    value = {
      fg = "#81C8BE"
    },
  }
})
