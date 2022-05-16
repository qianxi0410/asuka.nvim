vim.g.vscode_style = "dark"

vim.cmd [[
try
  colorscheme vscode
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme darkplus
  set background=dark
endtry
]]
