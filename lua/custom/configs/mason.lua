local opt = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- go stuff
    "gopls",
    "gofumpt",

    -- rust stuff
    "rust-analyzer",
    "rustfmt",
  },
}

return opt
