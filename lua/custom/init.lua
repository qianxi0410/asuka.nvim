-- neovim's config
vim.opt.pumheight = 10
vim.opt.pumwidth = 20
vim.opt.relativenumber = true
vim.opt.completeopt = "menuone,noinsert"
vim.opt.complete = ".,w,b,k"

-- ban auto comment new_lines
vim.cmd [[autocmd FileType * set formatoptions-=ro]]
