require("nvim-tree").setup({
  -- disables netrw completely
  disable_netrw = false,
  -- hijack netrw window on startup
  hijack_netrw = false,
  -- open the tree when running this setup function
  open_on_setup = false,
  -- will not open on setup if the filetype is in this list
  ignore_ft_on_setup = {},
  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  open_on_tab = true,
  -- hijacks new directory buffers when they are opened.
  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor = false,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  update_cwd = true,
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable = false,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd = false,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {},
  },
  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd = nil,
    -- the command arguments as a list
    args = {},
  },
  view = {
    side = "left",
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,
      -- list of mappings to set on the tree manually
      list = {},
    },
  },
  renderer = {
    highlight_git = true,
    indent_markers = {
      enable = true,
    },
    icons = {
      webdev_colors = true,
    },
  },
  git = {
    ignore = false,
  },
})

-- Disable default mappings by plugin
-- Bindings are enable by default, disabled on any non-zero value
-- let nvim_tree_disable_keybindings=1

vim.api.nvim_set_keymap("n", ";e", "<CMD>NvimTreeToggle<CR>", { noremap = true })
-- nnoremap <leader>r :NvimTreeRefresh<CR>
vim.api.nvim_set_keymap("n", ";a", "<CMD>NvimTreeFindFile<CR>", { noremap = true })
-- NvimTreeOpen and NvimTreeClose are also available if you need them

-- a list of groups can be found at `:help nvim_tree_highlight`
-- highlight NvimTreeFolderIcon guibg=blue
require("easy-augroup").create_hl_group("NvimTreeGit", {
  {
    name = "NvimTreeGitIgnored",
    value = {
      fg = "#626880",
    },
  },
})
