local bufferline = require "bufferline"

bufferline.setup {
  options = {
    diagnostics = "nvim_lsp",
    right_mouse_command = "vertical sbuffer", -- Open buffer in vertical split
    separator_style = "slant",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "(" .. count .. ")"
    end,
    style_preset = {
      bufferline.style_preset.no_italic,
      bufferline.style_preset.no_bold,
      -- bufferline.style_preset.minimal, -- 清空样式
    },
    offsets = {
      {
        filetype = "neo-tree",
        text = "File Explorer",
        -- highlight = "Directory",
        spearator = true,
        text_align = "center",
      },
    },
  },
}
