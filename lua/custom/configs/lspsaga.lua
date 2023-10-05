require("lspsaga").setup {
  symbol_in_winbar = {
    enable = true,
    hide_keyword = false,
    show_file = true,
    folder_level = 0,
    color_mode = true,
    delay = 100,
  },
  code_action = {
    num_shortcut = true,
    only_in_cursor = false,
    show_server_name = true,
    extend_gitsigns = false,
    keys = {
      quit = "q",
      exec = "<CR>",
    },
  },
  lightbulb = {
    enable = false,
    sign = true,
    virtual_text = false,
    debounce = 10,
    sign_priority = 20,
  },
  rename = {
    in_select = false,
    auto_save = false,
    project_max_width = 0.5,
    project_max_height = 0.5,
    keys = {
      quit = "<C-c>",
      exec = "<CR>",
      select = "x",
    },
  },
  finder = {
    methods = {
      ["tyd"] = "textDocument/typeDefinition",
    },
  },
  outline = {
    auto_preview = false,
  },
  scroll_preview = {
    scroll_down = "<C-d>",
    scroll_up = "<C-u>",
  },
  implement = {
    enable = true,
    sign = true,
    virtual_text = true,
    priority = 100,
  },
  request_timeout = 3000,
}
