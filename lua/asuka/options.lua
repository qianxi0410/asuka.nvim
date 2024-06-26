local G = require "asuka.global"

local opt = {
  number = true, -- 显示行号
  relativenumber = true, -- 使用相对行号
  cursorline = true, -- 高亮当前鼠标所在行
  cursorlineopt = "both",
  autoindent = true, -- 自动缩进
  ruler = true,
  showtabline = 2, -- 无论如何都显示 tabline
  clipboard = "unnamedplus", -- 和系统共享剪切板
  hlsearch = true, -- 高亮搜索
  -- smartcase = true, -- 智能大小写
  ignorecase = true, -- 忽略大小写
  undofile = true,
  undodir = G.cache_dir .. "undo",
  signcolumn = "yes",
  smartindent = true,
  tabstop = 2, -- tab 的显示宽度对应的空格数量
  softtabstop = 2, -- 按下 tab 会出现几个 space
  expandtab = true, -- tab 扩展为空格
  shiftwidth = 2, -- 缩进的宽度为几个 space
  smarttab = true,
  list = false, -- 显示不可见字符
  listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←,eol:↲",
  termguicolors = true, -- bufferline 需要
  timeout = true,
  timeoutlen = 300,
  splitright = true, -- 新窗口在右边
  splitbelow = true, -- 新窗口在下边
  foldcolumn = "0", -- 折叠栏宽度
  foldlevel = 99,
  foldlevelstart = 99,
  foldenable = true, -- 默认不折叠
  guicursor = "n-v-ve-c:block,i-sm-ci:hor20,r-cr-o:hor20",
  fileformats = "unix,mac,dos",
  updatetime = 200,
  visualbell = true,
  autowrite = true,
  backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",
  concealcursor = "niv",
  diffopt = "filler,iwhite,internal,linematch:60,algorithm:patience",
  equalalways = false,
  formatoptions = "1jcroql",
  grepformat = "%f:%l:%c:%m",
  grepprg = "rg --hidden --vimgrep --smart-case --",
  helpheight = 12,
  infercase = true, -- 自动调整大小写
  jumpoptions = "stack",
  laststatus = 3, -- 解决了 lualine 打开 neotree 显示状态栏消失的问题
  linebreak = true, -- 换行时自动断行
  pumblend = 0,
  pumheight = 15,
  redrawtime = 1500,
  scrolloff = 2,
  sessionoptions = "buffers,curdir,folds,help,tabpages,winpos,winsize",
  shada = "!,'500,<50,@100,s10,h",
  shiftround = true,
  shortmess = "aoOTIcF",
  showbreak = "↳  ",
  showcmd = false,
  showmode = false,
  sidescrolloff = 5,
  smartcase = true,
  splitkeep = "screen",
  startofline = false,
  swapfile = false,
  switchbuf = "usetab,uselast",
  synmaxcol = 2500,
  ttimeout = true,
  ttimeoutlen = 0,
  -- Please do NOT set `updatetime` to above 500, otherwise most plugins may not function correctly
  viewoptions = "folds,cursor,curdir,slash,unix",
  virtualedit = "block",
  whichwrap = "h,l,<,>,[,],~",
  wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
  wildignorecase = true,
  -- Do NOT adjust the following option (winblend) if you're using transparent background
  winblend = 0,
  winminwidth = 10,
  winwidth = 30,
  wrap = false,
  wrapscan = true,
  writebackup = false,
}

for k, v in pairs(opt) do
  vim.opt[k] = v
end
