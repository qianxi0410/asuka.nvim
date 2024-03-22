require("go").setup {
  dap_debug_gui = false,
  luasnip = true,
  lsp_cfg = false,
  icons = false,
  lsp_on_attach = nil,
  lsp_codelens = false, -- 会破坏 debug，需要设置为 false
  lsp_document_formatting = false, -- use none-ls
  lsp_inlay_hints = {
    enable = false, -- 暂时坏了，issue: https://github.com/ray-x/go.nvim/issues/416
    style = "inlay",
    only_current_line = false,
    show_variable_name = true,
    parameter_hints_prefix = "󰊕 ",
    show_parameter_hints = true,
    other_hints_prefix = "=>",
    highlight = "Comment",
  },
  diagnostic = false, -- use none-ls
}
