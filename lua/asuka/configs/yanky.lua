local utils = require "yanky.utils"
local mapping = require "yanky.telescope.mapping"

require("yanky").setup {
  ring = {
    history_length = 1000,
    storage = "sqlite",
    storage_path = vim.fn.stdpath "data" .. "/databases/yanky.db", -- Only for sqlite storage
    sync_with_numbered_registers = true,
    cancel_event = "update",
    ignore_registers = { "_" },
    update_register_on_cycle = false,
  },
  picker = {
    telescope = {
      mappings = {
        default = mapping.put "p",
        i = {
          ["<C-p>"] = mapping.put "p",
          ["<C-k>"] = mapping.put "P",
          ["<C-x>"] = mapping.delete(),
          ["<C-r>"] = mapping.set_register(utils.get_default_register()),
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
}
