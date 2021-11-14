vim.g.toggle_list_copen_command = "botright copen"
vim.g.toggle_list_no_mappings = true

local map_opts = {silent = true, noremap = true}

vim.api.nvim_set_keymap("n", ";c", "<CMD>call ToggleQuickfixList()<CR>", map_opts)
