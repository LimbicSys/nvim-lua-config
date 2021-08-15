CppFunc={namespaces = {}, return_type = nil, return_kind = "", func_name="", params=""}
CppFunc.__index = CppFunc

function CppFunc:new(namespaces, return_type, return_kind, func_name, params)
  local obj = {}
  setmetatable(obj, CppFunc)
  obj.namespaces = namespaces
  obj.return_type = return_type
  obj.return_kind = return_kind
  obj.func_name = func_name
  obj.params = params
  return obj
end
