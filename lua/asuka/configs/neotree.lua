-- 让 neotree 使用 nvim-tree 的主题
vim.cmd [[
highlight! link NeoTreeDirectoryIcon NvimTreeFolderIcon
highlight! link NeoTreeDirectoryName NvimTreeFolderName
highlight! link NeoTreeSymbolicLinkTarget NvimTreeSymlink
highlight! link NeoTreeRootName NvimTreeRootFolder
highlight! link NeoTreeDirectoryName NvimTreeOpenedFolderName
highlight! link NeoTreeFileNameOpened NvimTreeOpenedFile
]]

require("neo-tree").setup {
  source_selector = {
    enable_diagnostics = false,
    winbar = true, -- only show in top
    statusline = false,
    sources = {
      { source = "filesystem" },
      { source = "git_status" },
      { source = "buffers" },
    },
  },
  git_status = {
    symbols = {
      added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
      modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
      deleted = "✖",
      renamed = "󰁕",
      untracked = "",
      ignored = "",
      unstaged = "󰄱",
      staged = "",
      conflict = "",
    },
  },
  window = {
    position = "left",
    width = 30,
    mappings = {
      ["e"] = function()
        vim.api.nvim_exec("Neotree focus filesystem left", true)
      end,
      ["b"] = function()
        vim.api.nvim_exec("Neotree focus buffers left", true)
      end,
      ["g"] = function()
        vim.api.nvim_exec("Neotree focus git_status left", true)
      end,
    },
  },
}
