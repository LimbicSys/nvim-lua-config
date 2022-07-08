local vim = vim
vim.g.did_load_filetypes = 0
vim.g.do_filetype_lua = 1

local pack = require("core.pack")

require("core.basic")
pack.ensure_plugins()
pack.load_compile()
-- require("keymap")
