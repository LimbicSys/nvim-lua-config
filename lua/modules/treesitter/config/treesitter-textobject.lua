require("nvim-treesitter.configs").setup({
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = false,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
      -- You can choose the select mode (default is charwise 'v')
      selection_modes = {
        ["@parameter.outer"] = "v", -- charwise
        ["@function.outer"] = "V", -- linewise
        ["@class.outer"] = "<c-v>", -- blockwise
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding xor succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      include_surrounding_whitespace = true,
    },
  },
})
