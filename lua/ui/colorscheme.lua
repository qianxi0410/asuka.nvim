vim.cmd [[
try
  colorscheme sonokai
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme darkplus
  set background=dark
endtry
]]
