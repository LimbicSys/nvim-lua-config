local M = {}

local InputMethodSwitcher = require("im-switcher.switcher")
local augroup = require("easy-augroup")

function M.setup(opt)
  local obtain_im_cmd = opt.obtain_im_cmd or ""
  local switch_im_cmd = opt.switch_im_cmd or ""
  local default_im_key = opt.default_im_key or ""
  Switcher = InputMethodSwitcher:new(obtain_im_cmd, switch_im_cmd, default_im_key)

  augroup.create_cmd_group("AutoSwitchInput", {
    {
      event = "InsertLeave",
      opts = {
        pattern = "*",
        callback = function()
          Switcher:switch_to_default_im()
        end,
      },
    },
    {
      event = "InsertEnter",
      opts = {
        pattern = "*",
        callback = function()
          Switcher:resume_im()
        end,
      },
    },
  })
end

return M
