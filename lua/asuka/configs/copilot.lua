require("copilot").setup {
  panel = {
    enabled = false,
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 0,
    keymap = {
      accept = "<A-a>",
      accept_word = false,
      accept_line = false,
      next = "<A-]>",
      prev = "<A-[>",
      dismiss = "<C-]>",
    },
  },
  copilot_node_command = "node", -- Node.js version must be > 18.x
  server_opts_overrides = {},
  filetypes = {
    markdown = true,
  },
}
