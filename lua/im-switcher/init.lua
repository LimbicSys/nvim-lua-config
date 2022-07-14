local InputMethodSwitcher = require("im-switcher.switcher")
local augroup = require("easy-augroup")

local function setup(opt)
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

local opt = {}

if vim.fn.has("wsl") == 1 then
  opt.obtain_im_cmd = "im-select.exe"
  opt.switch_im_cmd = "im-select.exe"
  opt.default_im_key = "1033"
  setup(opt)
elseif vim.fn.has("mac") == 1 then
  opt.obtain_im_cmd = "macism"
  opt.switch_im_cmd = "macism"
  opt.default_im_key = "com.apple.keylayout.ABC"
  setup(opt)
end
