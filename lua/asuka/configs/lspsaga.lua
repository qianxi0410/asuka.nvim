require("lspsaga").setup {
  code_action = {
    extend_gitsigns = true,
  },
  symbol_in_winbar = {
    folder_level = 0,
  },
  diagnostic = {
    show_code_action = false,
  },
  finder = {
    methods = {
      tyd = "textDocument/typeDefinition",
    },
  },
  lightbulb = {
    enable = false,
  },
  outline = {
    detail = false,
    auto_preview = false,
  },
}
