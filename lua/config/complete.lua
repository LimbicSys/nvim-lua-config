vim.opt.completeopt = { "menuone", "noinsert", "noselect" }

local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      -- You must install `vim-vsnip` if you use the following as-is.
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  completion = {
    completeopt = "menuone,noselect",
    keyword_length = 2,
  },
  -- You can set mapping if you want.
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<C-y>"] = cmp.mapping.confirm(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  -- You should specify your *installed* sources.
  sources = {
    { name = "nvim_lsp" },
    { name = "vsnip" },
    -- {name = "luasnip"},
    -- {name = "buffer"},
    { name = "path" },
  },
})

-- you need setup cmp first put this after cmp.setup()
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

vim.cmd([[highlight! link CmpItemAbbrMatch Pmenu]])

vim.cmd([[highlight! link CmpItemAbbrMatchFuzzy Pmenu]])

vim.cmd([[highlight! link CmpItemMenu Pmenu]])

vim.cmd([[highlight! CmpItemAbbrDeprecated gui=strikethrough]])
