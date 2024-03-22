require("trouble").setup {
  position = "right", -- position of the list can be: bottom, top, left, right
  width = 40, -- width of the list when position is left or right
  icons = true, -- use devicons for filenames
  mode = "document_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
  use_diagnostic_signs = true, -- enabling this will use the signs defined in your lsp client
}
