return {
  {
    "skywind3000/asyncrun.vim",
    init = function()
      vim.g.asyncrun_open = 6
      vim.g.asyncrun_rootmarks = { ".git", ".svn", ".root", ".project", ".hg" }
    end,
  },

  {
    "skywind3000/asynctasks.vim",
    dependencies = "skywind3000/asyncrun.vim",
    init = function()
      vim.g.asynctasks_term_pos = "bottom"
    end,
    config = function()
      require("modules.task.config.asynctasks")
    end,
  },
}
