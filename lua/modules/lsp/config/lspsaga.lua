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
  symbol_in_winbar = {
    separator = " > ",
    show_file = false,
    in_custom = true,
  },
})

local opt = { silent = true, noremap = true }
vim.keymap.set("n", "<leader>dd", require("lspsaga.diagnostic").show_line_diagnostics, opt)
