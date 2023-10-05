local utils = require "yanky.utils"
local mapping = require "yanky.telescope.mapping"

require("yanky").setup {
  picker = {
    telescope = {
      mappings = {
        default = mapping.put "p",
        i = {
          ["<c-g>"] = mapping.put "p",
          ["<c-k>"] = mapping.put "P",
          ["<c-x>"] = mapping.delete(),
          ["<c-r>"] = mapping.set_register(utils.get_default_register()),
        },
        n = {
          p = mapping.put "p",
          P = mapping.put "P",
          d = mapping.delete(),
          r = mapping.set_register(utils.get_default_register()),
        },
      },
    },
  },
  ring = {
    history_length = 100,
    storage = "shada",
    storage_path = vim.fn.stdpath "data" .. "/databases/yanky.db", -- Only for sqlite storage
    sync_with_numbered_registers = true,
    cancel_event = "update",
  },
  system_clipboard = {
    sync_with_ring = true,
  },
  highlight = {
    on_put = true,
    on_yank = true,
    timer = 500,
  },
  preserve_cursor_position = {
    enabled = true,
  },
  textobject = {
    enabled = false,
  },
}
