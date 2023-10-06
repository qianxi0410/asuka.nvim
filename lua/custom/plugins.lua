---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
      -- golang
      {
        "ray-x/go.nvim",
        config = function()
          require "custom.configs.go"
        end,
        event = { "CmdlineEnter" },
        ft = { "go", "gomod" },
        build = ':lua require("go.install").update_all_sync()',
      },
      -- rust
      {
        "simrat39/rust-tools.nvim",
        config = function()
          require "custom.configs.rust"
        end,
        ft = { "rust" },
      },
      -- lspsaga
      {
        "nvimdev/lspsaga.nvim",
        init = function()
          require("core.utils").load_mappings "lspsaga"
        end,
        config = function()
          require "custom.configs.lspsaga"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = require "custom.configs.mason",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "custom.configs.treesitter",
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = require "custom.configs.nvimtree",
  },

  {
    "hrsh7th/nvim-cmp",
    opts = require "custom.configs.cmp",
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = { "CursorHold", "CursorHoldI" },
    config = function()
      require "custom.configs.escape"
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function()
      require "custom.configs.copilot"
    end,
  },

  {
    "saecki/crates.nvim",
    tag = "v0.3.0",
    config = function()
      require("crates").setup()
    end,
    ft = { "rust", "toml" },
  },

  {
    "wakatime/vim-wakatime",
    event = "BufRead",
  },

  {
    "nvim-pack/nvim-spectre",
    event = "InsertEnter",
    init = function()
      require("core.utils").load_mappings "spectre"
    end,
    config = function()
      require "custom.configs.spectre"
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    event = "BufRead",
    config = function()
      require "custom.configs.mkdp"
    end,
  },

  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose" },
  },

  {
    "phaazon/hop.nvim",
    branch = "v2",
    event = { "CursorHold", "CursorHoldI" },
    init = function()
      require("core.utils").load_mappings "hop"
    end,
    config = function()
      require "custom.configs.hop"
    end,
  },

  {
    "RRethy/vim-illuminate",
    event = { "CursorHold", "CursorHoldI" },
    config = function()
      require "custom.configs.illuminate"
    end,
  },

  {
    "gelguy/wilder.nvim",
    event = "CmdlineEnter",
    config = function()
      require "custom.configs.wilder"
    end,
    dependencies = {
      {
        "romgrk/fzy-lua-native",
      },
    },
  },

  {
    "karb94/neoscroll.nvim",
    event = { "CursorHold", "CursorHoldI" },
    config = function()
      require "custom.configs.neoscroll"
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-file-browser.nvim" },
      { "nvim-telescope/telescope-frecency.nvim", dependencies = { "kkharji/sqlite.lua" } },
      { "nvim-telescope/telescope-dap.nvim" },
    },
    opts = require "custom.configs.telescope",
  },

  {
    "mfussenegger/nvim-dap",
    init = require("core.utils").load_mappings "dap",
    config = function()
      require "custom.configs.dap"
    end,
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        config = function()
          require "custom.configs.dap-ui"
        end,
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
          require "custom.configs.dap-virtual-text"
        end,
      },
    },
  },

  {
    "nvim-neotest/neotest",
    config = function()
      require "custom.configs.neotest"
    end,
    init = require("core.utils").load_mappings "neotest",
    dependencies = {
      { "nvim-neotest/neotest-go" },
      { "rouge8/neotest-rust" },
    },
  },

  {
    "axieax/urlview.nvim",
    event = "BufRead",
    config = function()
      require "custom.configs.urlview"
    end,
  },

  {
    "sindrets/diffview.nvim",
    config = function()
      require "custom.configs.diffview"
    end,
  },

  {
    "mrjones2014/legendary.nvim",
    -- since legendary.nvim handles all your keymaps/commands,
    -- its recommended to load legendary.nvim before other plugins
    lazy = false,
    init = function()
      require("core.utils").load_mappings "legendary"
    end,
    config = function()
      require "custom.configs.legendary"
    end,
    dependencies = {
      {
        "stevearc/dressing.nvim",
        config = function()
          require "custom.configs.dressing"
        end,
      },
    },
  },

  {
    "gbprod/yanky.nvim",
    event = "BufRead",
    init = require("core.utils").load_mappings "yanky",
    config = function()
      require "custom.configs.yanky"
    end,
  },
}

return plugins
