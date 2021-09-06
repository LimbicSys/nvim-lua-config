local Job = require("plenary.job")

local function trim(str)
  return str:gsub("^%s+", ""):gsub("%s+$", "")
end

local function is_insert_like_mode(mode)
  return mode == "Normal" or mode == "Replace"
end

-- job:new(
--   {
--     command = "im-select.exe",
--     args = {"1033"}
--   }
-- ):start()

-- InputMethodSwitcher changes input method when mode changed
local InputMethodSwitcher = {
  saved_im_key = "",
  default_im = "1033"
}
InputMethodSwitcher.__index = InputMethodSwitcher

function InputMethodSwitcher:switch_input_method(prev_mode, new_mode)
  -- when you exit from insert-like mode, save origin input method and set it to default
  local is_prev_mode_insert_like = is_insert_like_mode(prev_mode)
  local is_new_mode_insert_like = is_insert_like_mode(new_mode)
  if is_prev_mode_insert_like ~= is_new_mode_insert_like then
    if is_new_mode_insert_like then
      self:resume_im()
    else
      self:switch_to_default_im()
    end
  end
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

      local default_im_key = "1033"
      if default_im_key ~= self.saved_im_key then
        self:switch_to_im(default_im_key)
      end
    end
  )
end

-- resume origin input method
function InputMethodSwitcher:resume_im()
  if self.saved_im_key ~= self.default_im then
    self:switch_to_im(self.default_im)
  end
end

function InputMethodSwitcher:switch_to_im(im_key)
  if im_key ~= nil and im_key ~= "" then
    Job:new(
      {
        command = "im-select.exe",
        arg = im_key
      }
    ):start()
  end
end
