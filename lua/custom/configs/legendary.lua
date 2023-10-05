require("legendary").setup {
  include_builtin = true,
  auto_register_which_key = true,
  lazy_vim = { auto_register = true },
  which_key = {
    mappings = {},
    -- false if which-key.nvim handles binding them,
    -- set to true if you want legendary.nvim to handle binding
    -- the mappings; if not passed, true by default
    do_binding = false,
  },
}
