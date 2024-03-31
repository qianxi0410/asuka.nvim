local opts = {
  gruvbox_material_background = "hard",
  gruvbox_material_foreground = "original",
  gruvbox_material_enable_bold = 1,
  gruvbox_material_enable_italic = 0,
  gruvbox_material_dim_inactive_windows = 0,
  gruvbox_material_ui_contrast = "high",
  gruvbox_material_float_style = "dim",
  gruvbox_material_diagnostic_text_highlight = 0,
  gruvbox_material_diagnostic_line_highlight = 1,
  gruvbox_material_diagnostic_virtual_text = "colored",
  gruvbox_material_statusline_style = "default",
}

for k, v in pairs(opts) do
  vim.g[k] = v
end
