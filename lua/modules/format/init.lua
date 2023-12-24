local format_wrapper = require("format-wrapper")

return {
  {
    {
      "stevearc/conform.nvim",
      event = { "BufWritePre" },
      keys = {
        {
          -- Customize or remove this keymap to your liking
          "<space>fb",
          function()
            require("conform").format({ async = true, lsp_fallback = true })
          end,
          mode = { "n", "v" },
          desc = "Format buffer",
        },
      },
      -- Everything in opts will be passed to setup()
      opts = {
        -- Define your formatters
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "isort", "black" },
          cpp = { "clang-format" },
          c = { "clang-format" },
          ["_"] = { "trim_whitespace" },
        },
        -- Set up format-on-save
        format_on_save = function(bufnr)
          -- Disable autoformat on certain filetypes
          -- local ignore_filetypes = {}
          -- if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
          --   return
          -- end
          -- Disable with a global or buffer-local variable
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end
          -- ...additional logic...
          return { timeout_ms = 500, lsp_fallback = true }
        end,
        -- Customize formatters
        formatters = {
          shfmt = {
            prepend_args = { "-i", "2" },
          },
        },
      },
      init = function()
        -- If you want the formatexpr, here is the place to set it
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
        vim.g.disable_autoformat = false
        vim.api.nvim_create_user_command("ToggleFormat", format_wrapper.toggle_format_on_save, {})

        vim.api.nvim_create_user_command("FormatBuffer", function(args)
          local range = nil
          if args.count ~= -1 then
            local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
            range = {
              start = { args.line1, 0 },
              ["end"] = { args.line2, end_line:len() },
            }
          end
          require("conform").format({ async = true, lsp_fallback = true, range = range })
        end, { range = true })
      end,
    },
  },
}
