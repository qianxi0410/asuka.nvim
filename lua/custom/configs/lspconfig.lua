local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "bashls",
  "jsonls",
  "taplo",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls", "serve" },
  filetypes = { "go", "gomod", "gowork" },
  settings = {
    gopls = {
      usePlaceholders = false,
      analyses = {
        unusedparams = true,
        unreachable = true,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
}

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "rust" },
  settings = {
    ["rust-analyzer"] = {
      root_dir = lspconfig.util.root_pattern "Cargo.toml",
      unstable_features = true,
      build_on_save = false,
      all_features = true,
      checkOnSave = {
        command = "clippy",
      },
      diagnostics = {
        enable = true,
        experimental = {
          enable = true,
        },
      },
      assist = {
        importGranularity = "module",
        importPrefix = "by_self",
      },
      cargo = {
        loadOutDirsFromCheck = true,
        all_features = true,
      },
      procMacro = {
        enable = true,
      },
    },
  },
}

lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = vim.tbl_deep_extend("keep", { offsetEncoding = { "utf-16", "utf-8" } }, capabilities),
  single_file_support = true,
  filetypes = { "c", "cpp" },
  cmd = {
    "clangd",
    "-j=12",
    "--enable-config",
    "--background-index",
    "--pch-storage=memory",
    "--clang-tidy",
    "--all-scopes-completion",
    "--completion-style=detailed",
    "--header-insertion-decorators",
    "--header-insertion=iwyu",
    "--suggest-missing-includes",
    "--cross-file-rename",
    "--function-arg-placeholders=false",
    "--ranking-model=decision_forest",
    "--limit-references=3000",
    "--limit-results=350",
  },
}
