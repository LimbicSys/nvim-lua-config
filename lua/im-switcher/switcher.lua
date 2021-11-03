local Job = require("plenary.job")

local function trim(str)
  return str:gsub("^%s+", ""):gsub("%s+$", "")
end

-- InputMethodSwitcher changes input method when mode changed
local InputMethodSwitcher = {
  obtain_im_cmd = "",
  switch_im_cmd = "",
  default_im_key = ""
  -- saved_im_key = ""
}

InputMethodSwitcher.__index = InputMethodSwitcher

function InputMethodSwitcher:new(obtain_im_cmd, switch_im_cmd, default_im_key)
  local self = {}
  setmetatable(self, InputMethodSwitcher)
  self.obtain_im_cmd = obtain_im_cmd
  self.switch_im_cmd = switch_im_cmd
  self.default_im_key = default_im_key
  -- self.saved_im_key = ""
  return self
end

-- save origin input method and set input method to default
function InputMethodSwitcher:switch_to_default_im()
  if self.obtain_im_cmd == "" or self.obtain_im_cmd == nil then
    return
  end
  local insert_im_key = ""
  local job =
    Job:new(
    {
      command = self.obtain_im_cmd
    }
  )
  job:add_on_exit_callback(
    function(j, code, singnal)
      insert_im_key = j:result()[1]
      if insert_im_key ~= nil or #insert_im_key > 0 then
        vim.b.saved_im_key = trim(insert_im_key)
      end
      if self.default_im_key ~= vim.b.saved_im_key then
        self:switch_to_im(self.default_im_key)
      end
    end
  )
  job:start()
end

-- resume origin input method
function InputMethodSwitcher:resume_im()
  if vim.b.saved_im_key ~= self.default_im_key then
    self:switch_to_im(vim.b.saved_im_key)
  end
end

function InputMethodSwitcher:switch_to_im(im_key)
  if self.switch_im_cmd == "" or self.switch_im_cmd == nil then
    return
  end
  if im_key ~= nil and im_key ~= "" then
    Job:new(
      {
        command = self.switch_im_cmd,
        args = {im_key}
      }
    ):start()
  end
end

return InputMethodSwitcher
