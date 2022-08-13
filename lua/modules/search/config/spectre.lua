local spectre = require("spectre")
local opts = { noremap = true }
vim.keymap.set("n", "<Leader>S", spectre.open, opts)
vim.keymap.set("n", "<Leader>sw", function()
  spectre.open_visual({ select_word = true })
end, opts)
vim.keymap.set("n", "<Leader>s", spectre.open_visual, opts)
vim.keymap.set("n", "<Leader>sp", spectre.open_file_search, opts)
