local opts = {
  mkdp_theme = "light",
}

for k, v in pairs(opts) do
  vim.g[k] = v
end
