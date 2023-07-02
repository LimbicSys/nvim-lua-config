require("colorscheme")

local bufferline_hl = require("catppuccin.groups.integrations.bufferline").get({})

require("bufferline").setup({
  options = {
    show_buffer_close_icons = false,
    show_buffer_icons = true,
    separator_style = "thick",
    -- enforce_regular_tabs = true
    custom_filter = function(buf, buf_nums)
      local bt = vim.bo[buf].buftype
      local filter_type = { "quickfix", "terminal", "prompt" }
      for _, t in pairs(filter_type) do
        if bt == t then
          return false
        end
      end

      -- java class file
      if vim.fn.bufname(buf):match("class$") then
        return false
      end

      return true
    end,
    offsets = {
      {
        filetype = "neo-tree",
        text = "Neo-tree",
        highlight = "Directory",
        text_align = "left",
      },
    },
  },
  highlights = bufferline_hl,
})

-- These commands will navigate through buffers in order regardless of which mode you are using
-- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
local map_opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "[b", "<CMD>BufferLineCyclePrev<CR>", map_opts)
vim.api.nvim_set_keymap("n", "]b", "<CMD>BufferLineCycleNext<CR>", map_opts)
