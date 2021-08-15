local CppFunc = {namespaces = {}, class = "", return_type = nil, return_kind = "", func_name = "", params = ""}
CppFunc.__index = CppFunc

local padding = " "

function CppFunc:new(namespaces, class, return_type, return_kind, func_name, params)
  local self = {}
  setmetatable(self, CppFunc)
  self.namespaces = namespaces
  self.class = class
  self.return_type = return_type
  self.return_kind = return_kind
  self.func_name = func_name
  self.params = params
  return self
end

function CppFunc:get_func_def_text(namespace_start_idx)
  if #self.return_type == 0 or #self.func_name == 0 or #self.params == 0 then
    return ""
  end

  local func_text = self.return_type .. padding .. self.return_kind
  -- insert namespace if needed
  for i = namespace_start_idx, #self.namespaces, 1 do
    func_text = func_text .. self.namespaces[i] .. "::"
  end
  func_text = func_text .. self.class .. "::" .. self.func_name

  for i, param in ipairs(self.params) do
    -- remove write spaces at the beginning and put them in one line
    local idx = 1
    while idx < #param do
      local tmp = string.sub(param, idx, idx)
      if tmp ~= " " and tmp ~= "\t" then
        break
      end
      idx = idx + 1
    end
    if i ~= 1 then
      func_text = func_text .. padding
    end
    func_text = func_text .. string.sub(param, idx)
  end

  return func_text
end

return CppFunc
