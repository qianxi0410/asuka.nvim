local cmp = require "cmp"

local opt = {
  preselect = cmp.PreselectMode.Item,
  performance = {
    async_budget = 1,
    max_view_entries = 120,
  },
  mapping = {
    ["<Up>"] = cmp.mapping.select_prev_item(),
    ["<Down>"] = cmp.mapping.select_next_item(),
  },
  sources = {
    { name = "nvim_lsp", max_item_count = 350 },
    { name = "nvim_lua" },
    -- { name = "luasnip" },
    { name = "path" },
    { name = "buffer" },
    { name = "crates" },
  },
}

return opt
