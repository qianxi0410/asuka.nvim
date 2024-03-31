-- 退出时恢复光标形状
vim.cmd [[
  augroup RestoreCursorShapeOnExit
      autocmd!
      autocmd VimLeave * set guicursor=a:hor20
  augroup END
]]

-- highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup="Search", timeout=200})
  augroup END
]]

-- apply the colorscheme
vim.cmd [[ colorscheme gruvbox-material ]]
