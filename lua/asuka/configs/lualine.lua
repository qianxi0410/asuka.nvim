local copilot = {
  "copilot",
  symbols = {
    status = {
      icons = {
        enabled = " ",
        sleep = " ", -- auto-trigger disabled
        disabled = " ",
        warning = " ",
        unknown = " ",
      },
      hl = {
        enabled = "#50FA7B",
        sleep = "#AEB7D0",
        disabled = "#6272A4",
        warning = "#FFB86C",
        unknown = "#FF5555",
      },
    },
    spinners = require("copilot-lualine.spinners").dots,
    spinner_color = "#6272A4",
  },
  show_colors = true,
  show_loading = true,
}

local ls = {
  function()
    local msg = "No Active Lsp"
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    local name = {}
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        table.insert(name, client.name)
      end
    end
    -- stringfy the list
    msg = table.concat(name, ", ")
    return msg
  end,
  icon = " ",
}

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = " ", warn = " ", info = " ", hint = "󰌵 " },
}

local filetype = {
  "filetype",
  colored = true, -- Displays filetype icon in color if set to true
  icon_only = true, -- Display only an icon for filetype
  icon = { align = "right" }, -- Display filetype icon on the right hand side
}

require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = "auto", -- gruvbox-material
    -- section_separators = { left = "", right = "" },
    -- component_separators = { left = "", right = "" },
    component_separators = "",
    section_separators = "",
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", diagnostics },
    lualine_c = { "filename" },
    lualine_x = { ls, "encoding", copilot, "fileformat", filetype },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}
