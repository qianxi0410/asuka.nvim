local dapui = require "dapui"

dapui.setup {
  mappings = {
    expand = { "o", "<2-LeftMouse>", "<CR>" },
    open = "O",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  layouts = {
    {
      elements = {
        "scopes",
        "stacks",
      },
      size = 40,
      position = "left",
    },
    {
      elements = {
        "breakpoints",
        "watches",
      },
      size = 25,
      position = "right",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 12,
      position = "bottom",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  render = {
    indent = 1,
    max_value_lines = 100,
  },
  windows = { indent = 1 },
}
