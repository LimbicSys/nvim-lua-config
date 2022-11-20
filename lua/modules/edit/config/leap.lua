require("leap")

local function add_default_mappings(force_3f)
  for _, _1_ in ipairs({
    { { "n", "x", "o" }, "s", "<Plug>(leap-forward-to)" },
    { { "n", "x", "o" }, "S", "<Plug>(leap-backward-to)" },
    { { "o" }, "x", "<Plug>(leap-forward-till)" },
    { { "o" }, "X", "<Plug>(leap-backward-till)" },
    { { "n", "x", "o" }, "gs", "<Plug>(leap-cross-window)" },
  }) do
    local _each_2_ = _1_
    local modes = _each_2_[1]
    local lhs = _each_2_[2]
    local rhs = _each_2_[3]
    for _0, mode in ipairs(modes) do
      if force_3f or ((vim.fn.mapcheck(lhs, mode) == "") and (vim.fn.hasmapto(rhs, mode) == 0)) then
        vim.keymap.set(mode, lhs, rhs, { silent = true })
      else
      end
    end
  end
  return nil
end

add_default_mappings()
