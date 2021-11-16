local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
-- local sorters = require("telescope.sorters")
local conf = require("telescope.config").values
local make_entry = require("telescope.make_entry")

local scan = require("plenary.scandir")
local Path = require("plenary.path")
local os_sep = Path.path.sep

local api = vim.api

local function loadTemplate(opts)
  opts = opts or {}

  opts.depth = opts.depth or 1
  opts.cwd = opts.cwd and vim.fn.expand(opts.cwd) or vim.loop.cwd()
  opts.new_filename = opts.new_filename or "newfile"
  opts.new_finder =
    opts.new_finder or
    function(path)
      opts.cwd = path
      local data = {}

      scan.scan_dir(
        path,
        {
          hidden = opts.hidden or false,
          add_dirs = true,
          depth = opts.depth,
          on_insert = function(entry, typ)
            table.insert(data, typ == "directory" and (entry .. os_sep) or entry)
          end
        }
      )
      table.insert(data, 1, ".." .. os_sep)

      return finders.new_table {
        results = data,
        entry_maker = (function()
          local gen = make_entry.gen_from_file(opts)
          return function(entry)
            local tmp = gen(entry)
            tmp.ordinal = Path:new(entry):make_relative(opts.cwd)
            return tmp
          end
        end)()
      }
    end

  pickers.new(
    opts,
    {
      prompt_title = "File Browser",
      finder = opts.new_finder(opts.cwd),
      previewer = conf.file_previewer(opts),
      sorter = conf.file_sorter(opts),
      attach_mappings = function(prompt_bufnr, map)
        local readToBuffer = function()
          local selection = action_state.get_selected_entry()
          actions.close(prompt_bufnr)
          if vim.fn.buflisted(opts.new_filename) == 1 then
            return
          end
          vim.cmd("tabe " .. opts.new_filename)
          vim.cmd("0read " .. selection.value)
          -- print(vim.inspect('exists'))
          api.nvim_feedkeys(api.nvim_replace_termcodes("<esc>", true, false, true), "n", true)
        end
        map("i", "<cr>", readToBuffer)
        map("n", "<cr>", readToBuffer)
        return true
      end
    }
  ):find()
end

function Load_clang_format_template()
  loadTemplate(
    {
      cwd = "~/.config/nvim/clang_format_template",
      new_filename = ".clang-format"
    }
  )
end

function Load_vimspector_template()
  loadTemplate(
    {
      cwd = "~/.config/nvim/vimspector_json",
      new_filename = ".vimspector.json"
    }
  )
end

local opts = {noremap = true, silent = true}
-- vim.api.nvim_set_keymap("n", "<leader>fs", "<cmd>lua Load_clang_format_template()<cr>", opts)
-- vim.api.nvim_set_keymap("n", "<leader>vs", "<cmd>lua Load_vimspector_template()<cr>", opts)
vim.api.nvim_set_keymap("n", ";f", "<Cmd>lua require('telescope.builtin').grep_string()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>h", "<Cmd>lua require('telescope.builtin').oldfiles({cwd_only=true})<CR>", opts)

vim.cmd("command! LoadClangFormatTemplate lua Load_clang_format_template()")
vim.cmd("command! LoadClangFormatTemplate lua Load_vimspector_template()")
