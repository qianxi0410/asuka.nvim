local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- pkg manager.
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"

  -- golang.
  use {
    "fatih/vim-go",
    ft = "go"
  }
  -- rust
  use "simrat39/rust-tools.nvim"
  -- comment gcc or gbc.
  use "numToStr/Comment.nvim"
  -- icons .
  use "kyazdani42/nvim-web-devicons"

  -- file explorer.
  use "kyazdani42/nvim-tree.lua"

  -- buffer explorer.
  use "akinsho/bufferline.nvim"

  -- lualine.
  use "nvim-lualine/lualine.nvim"

  -- internal terminal.
  use "akinsho/toggleterm.nvim"

  -- project find for telescope.
  use "ahmedkhalf/project.nvim"

  -- speed up.
  use "lewis6991/impatient.nvim"

  -- welcome page.
  use "goolord/alpha-nvim"
  -- hint for snapkey.
  use "folke/which-key.nvim"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- snippets
  use "L3MON4D3/LuaSnip" -- snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "nvim-lua/lsp-status.nvim" -- status bar for lsp-status
  use "nvim-lua/completion-nvim" -- completion for lsp-status

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  }
  use "nvim-telescope/telescope-ui-select.nvim"
  use "nvim-telescope/telescope-live-grep-raw.nvim"

  -- gps
  use {
    "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter"
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "nvim-treesitter/nvim-treesitter-textobjects" -- enhance texetobject selection
  use "romgrk/nvim-treesitter-context" -- show class/function at the top
  use "andymass/vim-matchup"

  -- git.
  use "lewis6991/gitsigns.nvim"
  use "f-person/git-blame.nvim"

  -- auto completion.
  use "github/copilot.vim"

  -- wakatime
  use "wakatime/vim-wakatime"

  -- markdown preview
  use "iamcco/markdown-preview.nvim"

  -- show color in hex
  use "norcalli/nvim-colorizer.lua"

  -- word serach
  use "kevinhwang91/nvim-hlslens"

  -- theme
  -- use "Mofiqul/vscode.nvim"
  use "ellisonleao/gruvbox.nvim"

  use "romgrk/fzy-lua-native"
  -- icons for Popupmenu.
  use "gelguy/wilder.nvim"

  -- debugger.
  use "ravenxrz/DAPInstall.nvim" -- help us install several debuggers
  use "ravenxrz/nvim-dap"
  use "theHamsta/nvim-dap-virtual-text"
  use "rcarriga/nvim-dap-ui"
  use "nvim-telescope/telescope-dap.nvim"
  use "mfussenegger/nvim-dap-python" -- debug python
  use { "leoluz/nvim-dap-go", module = "dap-go" } -- debug golang
  use { "jbyuki/one-small-step-for-vimkind", module = "osv" } -- debug any Lua code running in a Neovim instance

  -- higlight select word.
  use "RRethy/vim-illuminate"

  -- show todo item.
  use "folke/todo-comments.nvim"
  -- show startup time.
  use "dstein64/vim-startuptime"

  -- auto pair.
  use 'jiangmiao/auto-pairs'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
