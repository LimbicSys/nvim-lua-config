local M = {}

local InputMethodSwitcher = require("im-switcher.switcher")

function M.setup(opt)
  local obtain_im_cmd = opt.obtain_im_cmd or ""
  local switch_im_cmd = opt.switch_im_cmd or ""
  local default_im_key = opt.default_im_key or ""
  Switcher = InputMethodSwitcher:new(obtain_im_cmd, switch_im_cmd, default_im_key)

  vim.cmd([[
      augroup AutoSwitchInput
      autocmd!
      autocmd InsertLeave * lua Switcher:switch_to_default_im()
      autocmd InsertEnter * lua Switcher:resume_im()
    ]])
end

return M
