local npairs = require("nvim-autopairs")
-- local Rule = require("nvim-autopairs.rule")
-- local cond = require("nvim-autopairs.conds")

npairs.setup()
-- local rule = npairs.get_rule('"')
-- rule:with_pair(
--   function()
--     if vim.api.nvim_buf_get_option(0, "filetype") == "vim" then
--       return false
--     end
--     return true
--   end
-- )

-- rule = npairs.get_rule("(")
-- rule:with_pair(
--   function()
--     if vim.fn.pumvisible() ~= 0 then
--       return false
--     end
--     return true
--   end
-- )

-- skip it, if you use another global object
_G.MUtils = {}

local cmp = require("cmp")
MUtils.completion_confirm = function()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info()["selected"] ~= -1 then
      -- require'completion'.confirmCompletion()
      -- return npairs.esc("<c-y>")
      -- return vim.fn["compe#confirm"](npairs.esc("<cr>"))
      return cmp.confirm()
    else
      -- vim.api.nvim_select_popupmenu_item(0 , false , false ,{})
      -- require'completion'.confirmCompletion()
      return npairs.autopairs_cr()
    end
  else
    return npairs.autopairs_cr()
  end
end

-- remap("i", "<CR>", "v:lua.MUtils.completion_confirm()", {expr = true, noremap = true})
-- require("nvim-autopairs.completion.compe").setup({
--   map_cr = true, --  map <CR> on insert mode
--   map_complete = true -- it will auto insert `(` after select function or method item
-- })
