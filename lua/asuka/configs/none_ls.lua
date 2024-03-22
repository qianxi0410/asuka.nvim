local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {
  -- lua
  b.formatting.stylua,

  -- go
  b.formatting.goimports,
  b.formatting.golines.with {
    extra_args = {
      "--max-len=120",
      "--base-formatter=gofumpt",
    },
  },
  b.diagnostics.golangci_lint.with {
    extra_args = {
      "--disable-all",
      "--enable=errcheck",
      "--enable=gosimple",
      "--enable=govet",
      "--enable=ineffassign",
      "--enable=staticcheck",
      "--enable=typecheck",
      "--enable=unused",
      "--enable=revive",
      "--enable=errorlint",
      "--enable=exhaustive",
      "--enable=unconvert",
      "--enable=wsl",
    },
    diagnostic_config = {
      underline = false,
      virtual_text = true,
      signs = false,
      update_in_insert = false,
      severity_sort = true,
    },
  },
  b.code_actions.impl,
  b.code_actions.gomodifytags,
}

require("lsp-format").setup {}

null_ls.setup {
  sources = sources,
  debug = false,
  on_attach = require("lsp-format").on_attach,
}
