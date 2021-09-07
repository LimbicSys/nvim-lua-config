local Job = require("plenary.job")

local function trim(str)
  return str:gsub("^%s+", ""):gsub("%s+$", "")
end

-- InputMethodSwitcher changes input method when mode changed
local InputMethodSwitcher = {
  saved_im_key = "",
  default_im_key = ""
}
InputMethodSwitcher.__index = InputMethodSwitcher

function InputMethodSwitcher:new(default_im_key)
  local self = {}
  setmetatable(self, InputMethodSwitcher)
  self.default_im_key = default_im_key
  self.saved_im_key = ""
  return self
end

-- save origin input method and set input method to default
function InputMethodSwitcher:switch_to_default_im()
  local insert_im_key = ""
  local job =
    Job:new(
    {
      command = "im-select.exe"
    }
  )
  job:add_on_exit_callback(
    function(j, code, singnal)
      insert_im_key = j:result()[1]
      if insert_im_key ~= nil or #insert_im_key > 0 then
        self.saved_im_key = trim(insert_im_key)
      end
      if self.default_im_key ~= self.saved_im_key then
        self:switch_to_im(self.default_im_key)
      end
    end
  )
  job:start()
end

-- resume origin input method
function InputMethodSwitcher:resume_im()
  if self.saved_im_key ~= self.default_im_key then
    self:switch_to_im(self.saved_im_key)
  end
end

function InputMethodSwitcher:switch_to_im(im_key)
  if im_key ~= nil and im_key ~= "" then
    Job:new(
      {
        command = "im-select.exe",
        args = {im_key}
      }
    ):start()
  end
end

Switcher = InputMethodSwitcher:new("1033")

vim.cmd(
  [[
augroup AutoSwitchInput
autocmd!
autocmd InsertLeave * lua Switcher:switch_to_default_im()
autocmd InsertEnter * lua Switcher:resume_im()
]]
)
