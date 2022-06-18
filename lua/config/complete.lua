local cmp = require("cmp")
local clangd_source = require("config.complete_sources.clangd-constructor")

vim.opt.completeopt = { "menuone", "noinsert", "noselect" }

cmp.register_source("clangd_constructor", clangd_source.new())

cmp.setup({
  snippet = {
    expand = function(args)
      -- You must install `vim-vsnip` if you use the following as-is.
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  completion = {
    keyword_length = 1,
  },
  -- You can set mapping if you want.
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  -- You should specify your *installed* sources.
  sources = cmp.config.sources({
    { name = "clangd_constructor" },
    { name = "nvim_lsp" },
    { name = "vsnip" },
    -- {name = "luasnip"},
    -- {name = "buffer"},
    { name = "path" },
  }),
})

-- you need setup cmp first put this after cmp.setup()
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

vim.cmd([[highlight! link CmpItemAbbrMatch Pmenu]])

vim.cmd([[highlight! link CmpItemAbbrMatchFuzzy Pmenu]])

vim.cmd([[highlight! link CmpItemMenu Pmenu]])

vim.cmd([[highlight! CmpItemAbbrDeprecated gui=strikethrough]])

cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "nvim_lsp_document_symbol" },
    { name = "buffer" },
  }),
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { { name = "cmdline" }, { name = "cmdline_history" } },
    { name = "path" },
  },
})
