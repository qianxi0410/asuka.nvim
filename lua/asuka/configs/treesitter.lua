---@diagnostic disable: missing-fields
require("nvim-treesitter.configs").setup {
  ensure_installed = { "lua", "go", "markdown", "markdown_inline", "vimdoc" },
  sync_install = true,
  indent = {
    enable = true,
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
      },
      selection_modes = {
        ["@parameter.outer"] = "v", -- charwise
        ["@function.outer"] = "V", -- linewise
        ["@class.outer"] = "<c-v>", -- blockwise
      },
      include_surrounding_whitespace = true,
    },
  },
  matchup = {
    enable = true,
    disable = { "lua" },
    include_match_words = true,
    disable_virtual_text = false,
  },
}
