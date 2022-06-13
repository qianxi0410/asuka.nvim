local status_lsp, lspconfig = pcall(require, "lspconfig")
if not status_lsp then
  return
end

local status_rust, rust = pcall(require, "rust-tools")
if not status_rust then
  return
end


local opts = {
  tools = {
    autoSetHints = true,
    hover_with_actions = true,
    runnables = {
      use_telescope = true
    },
    inlay_hints = {
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },

  server = {
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy"
        },
      }
    }
  },
}

lspconfig.rust_analuzer.setup {
  checkOnSave = {
    command = "clippy"
  }
}

rust.setup(opts)
