-- 加载lazy
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local opts = require "asuka.configs.lazy_nvim"

local plugins = {
  -- 基础依赖
  "nvim-lua/plenary.nvim",
  "MunifTanjim/nui.nvim",
  "kyazdani42/nvim-web-devicons",
  "kkharji/sqlite.lua",
  -- 主题
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    config = function()
      require "asuka.configs.gruvbox"
    end,
  },
  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    config = function()
      require "asuka.configs.telescope"
    end,
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      },
      {
        "ahmedkhalf/project.nvim",
        event = { "CursorHold", "CursorHoldI" },
        config = function()
          require "asuka.configs.project"
        end,
      },
      {
        "gbprod/yanky.nvim",
        config = function()
          require "asuka.configs.yanky"
        end,
      },
      "debugloop/telescope-undo.nvim",
    },
  },
  -- 补全
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    config = function()
      require "asuka.configs.cmp_nvim"
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
      {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
          require "asuka.configs.copilot"
        end,
      },
      {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
      },
    },
  },
  -- 语言服务器
  {
    "neovim/nvim-lspconfig",
    event = { "CursorHold", "CursorHoldI" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },
    config = function()
      require "asuka.configs.lspconfig_nvim"
    end,
    dependencies = {
      {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
        config = function()
          require "asuka.configs.mason_nvim"
        end,
      },
      {
        "williamboman/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
          require "asuka.configs.mason_lspconfig"
        end,
      },
      {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
          require "asuka.configs.mason_nullls"
        end,
      },
      {
        "nvimdev/lspsaga.nvim",
        event = "LspAttach",
        config = function()
          require "asuka.configs.lspsaga"
        end,
      },
      {
        "folke/trouble.nvim",
        event = "LspAttach",
        config = function()
          require "asuka.configs.trouble"
        end,
      },
      {
        "stevearc/aerial.nvim",
        event = "LspAttach",
        config = function()
          require "asuka.configs.aerial"
        end,
      },
      {
        "nvimtools/none-ls.nvim",
        event = "BufReadPost",
        config = function()
          require "asuka.configs.none_ls"
        end,
        dependencies = {
          "lukas-reineke/lsp-format.nvim",
        },
      },
      {
        "j-hui/fidget.nvim",
        event = "LspAttach",
        config = true,
      },
      { "folke/neodev.nvim", ft = "lua", config = true },
      {
        "ray-x/go.nvim",
        event = { "CmdlineEnter" },
        ft = { "go", "gomod" },
        build = ':lua require("go.install").update_all_sync()',
        config = function()
          require "asuka.configs.go"
        end,
      },
    },
  },
  -- 代码调试
  {
    "mfussenegger/nvim-dap",
    cmd = {
      "DapSetLogLevel",
      "DapShowLog",
      "DapContinue",
      "DapToggleBreakpoint",
      "DapToggleRepl",
      "DapStepOver",
      "DapStepInto",
      "DapStepOut",
      "DapTerminate",
    },
    config = function()
      require "asuka.configs.dap"
    end,
    dependencies = {
      {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
          require "asuka.configs.dap_virtual_text"
        end,
      },
      {
        "rcarriga/nvim-dap-ui",
        config = function()
          require "asuka.configs.dap_ui"
        end,
      },
      "nvim-telescope/telescope-dap.nvim",
      {
        "jay-babu/mason-nvim-dap.nvim",
        config = function()
          require "asuka.configs.mason_dap"
        end,
      },
      {
        "leoluz/nvim-dap-go",
        config = function()
          require "asuka.configs.dap_go"
        end,
      },
    },
  },
  -- 语法
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    config = function()
      require "asuka.configs.treesitter"
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "mfussenegger/nvim-treehopper",
      { "andymass/vim-matchup", event = "BufReadPost" },
      { "abecodes/tabout.nvim", config = true },
      { "chrisgrieser/nvim-various-textobjs", opts = { useDefaultKeymaps = true }, config = true },
    },
  },
  -- 测试
  {
    "nvim-neotest/neotest",
    config = function()
      require "asuka.configs.neotest"
    end,
    dependencies = {
      "nvim-neotest/nvim-nio",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-go",
    },
  },
  -- 界面
  {
    "akinsho/bufferline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require "asuka.configs.bufferline"
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require "asuka.configs.lualine"
    end,
    dependencies = {
      "AndreM222/copilot-lualine",
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    config = function()
      require "asuka.configs.neotree"
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    event = "BufWinEnter",
    config = function()
      require "asuka.configs.dashboard"
    end,
  },
  -- Git
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    config = function()
      require "asuka.configs.gitsigns"
    end,
  },
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    dependencies = {
      "sindrets/diffview.nvim", -- optional - Diff integration
    },
    config = true,
  },
  { "akinsho/git-conflict.nvim", event = "BufReadPost", version = "*", config = true },
  -- 工具
  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    config = function()
      require "asuka.configs.illuminate"
    end,
  },
  {
    "echasnovski/mini.indentscope",
    event = "BufReadPost",
    config = function()
      require "asuka.configs.mini_indentscope"
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = "BufReadPost",
    config = true,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "nvim-pack/nvim-spectre",
    event = "InsertEnter",
    config = function()
      require "asuka.configs.spectre"
    end,
  },
  {
    "wakatime/vim-wakatime",
    event = "BufRead",
  },
  {
    "phaazon/hop.nvim",
    branch = "v2",
    event = "BufReadPost",
    config = function()
      require "asuka.configs.hop"
    end,
  },
  {
    "karb94/neoscroll.nvim",
    event = "BufReadPost",
    config = true,
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = true,
  },
  {
    "kevinhwang91/nvim-ufo",
    event = "BufRead",
    config = function()
      require "asuka.configs.ufo"
    end,
    dependencies = {
      "kevinhwang91/promise-async",
    },
  },
  {
    "kevinhwang91/nvim-hlslens",
    event = "CmdlineEnter",
    config = true,
  },
  {
    "lambdalisue/suda.vim",
    cmd = { "SudaRead", "SudaWrite" },
    config = true,
  },
  {
    "olimorris/persisted.nvim",
    cmd = {
      "SessionToggle",
      "SessionStart",
      "SessionStop",
      "SessionSave",
      "SessionLoad",
      "SessionLoadLast",
      "SessionLoadFromFile",
      "SessionDelete",
    },
    config = function()
      require "asuka.configs.persisted"
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPost",
    config = true,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
      require "asuka.configs.noice"
    end,
  },
}

require("lazy").setup(plugins, opts)
