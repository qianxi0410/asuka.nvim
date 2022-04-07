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
  use "wbthomason/packer.nvim" -- Have packer manage itself
  
  -- language
  use {
    "fatih/vim-go",
    ft = "go"
  }
  
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  use "nvim-lualine/lualine.nvim"
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "goolord/alpha-nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"

  use "yamatsum/nvim-cursorline"


  use "rcarriga/nvim-notify"

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  use "sainnhe/sonokai"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
 	use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
  use "hrsh7th/cmp-nvim-lua"
  use "ethanholz/nvim-lastplace"
  use "BurntSushi/ripgrep"
  use "nvim-pack/nvim-spectre"
  use "haringsrob/nvim_context_vt"
  use "tpope/vim-repeat"
  use "tpope/vim-surround"


  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  use "saadparwaiz1/cmp_luasnip"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "nvim-lua/lsp-status.nvim" -- status bar for lsp-status
  use "nvim-lua/completion-nvim" -- completion for lsp-status
  use "nvim-lua/lsp_extensions.nvim"
  use "j-hui/fidget.nvim"

  use "kosayoda/nvim-lightbulb"
  use "ray-x/lsp_signature.nvim"  -- show function signature when typing



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
  use "nvim-treesitter/nvim-treesitter-textobjects"  -- enhance texetobject selection
  use "romgrk/nvim-treesitter-context"  -- show class/function at the top
  use "andymass/vim-matchup"

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "f-person/git-blame.nvim"
  use "github/copilot.vim"

  -- wakatime
  use "wakatime/vim-wakatime"

  -- markdown preview
  use "iamcco/markdown-preview.nvim"

  -- show color in hex
  use "norcalli/nvim-colorizer.lua"

  -- motion
  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
    config = function()
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
  use { "rhysd/accelerated-jk", opt = true, event = "BufReadPost" }

  -- word serach
  use "kevinhwang91/nvim-hlslens"

  -- smooth scrolling
  use "karb94/neoscroll.nvim"

  use "gelguy/wilder.nvim"

  use "ray-x/lsp_signature.nvim"

  -- Debugger
  use "ravenxrz/DAPInstall.nvim"   -- help us install several debuggers
  use "ravenxrz/nvim-dap"
  use "theHamsta/nvim-dap-virtual-text"
  use "rcarriga/nvim-dap-ui"
  use "nvim-telescope/telescope-dap.nvim"
  use "mfussenegger/nvim-dap-python"    -- debug python
  use { "leoluz/nvim-dap-go", module = "dap-go" } -- debug golang
  use { "jbyuki/one-small-step-for-vimkind", module = "osv" } -- debug any Lua code running in a Neovim instance

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
