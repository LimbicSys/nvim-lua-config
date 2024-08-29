return {
  {
    "hrsh7th/vim-vsnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      -- "hrsh7th/vim-vsnip-integ"
    },
    event = "VeryLazy",
    init = function()
      -- If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
      -- let g:vsnip_filetypes = {}
      -- let g:vsnip_filetypes.javascriptreact = ['javascript']
      -- let g:vsnip_filetypes.typescriptreact = ['typescript']
      vim.g.vsnip_snippet_dir = "~/.config/nvim/snippet"
    end,
    config = function()
      require("modules.complete.config.vsnip")
    end,
  },

  --  {
  --   "L3MON4D3/LuaSnip",
  --   config = function()
  --     require("modules.complete.config.luasnip")
  --   end
  -- }
  --  {"saadparwaiz1/cmp_luasnip"}

  {
    "windwp/nvim-autopairs",
    dependencies = "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    init = function()
      vim.g.completion_confirm_key = ""
    end,
    config = function()
      require("modules.complete.config.autopairs")
    end,
  },

  -- lsp
  -- ({
  --   "ray-x/lsp_signature.nvim",
  --   config = function()
  --     require("modules.complete.config.lsp_signature")
  --   end,
  -- })

  {
    "garymjr/nvim-snippets",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    keys = {
      {
        "<c-j>",
        function()
          if vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
            return
          end
          return "<c-j>"
        end,
        expr = true,
        silent = true,
        mode = "i",
      },
      {
        "<c-j>",
        function()
          vim.schedule(function()
            vim.snippet.jump(1)
          end)
        end,
        expr = true,
        silent = true,
        mode = "s",
      },
      {
        "<c-k>",
        function()
          if vim.snippet.active({ direction = -1 }) then
            vim.schedule(function()
              vim.snippet.jump(-1)
            end)
            return
          end
          return "<c-k>"
        end,
        expr = true,
        silent = true,
        mode = { "i", "s" },
      },
    },
    opts = function(_, o)
      o.search_paths = { vim.fn.stdpath("config") .. "/snippet" }
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "garymjr/nvim-snippets",
      "hrsh7th/cmp-cmdline",
      "windwp/nvim-autopairs",
      "quangnguyen30192/cmp-nvim-tags",
      "dmitmel/cmp-cmdline-history",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    event = { "InsertEnter", "CmdlineEnter" },
    config = function()
      require("modules.complete.config.complete")
    end,
  },
}
