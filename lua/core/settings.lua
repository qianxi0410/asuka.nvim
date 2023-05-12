local settings = {}
local home = require("core.global").home

-- Set it to false if you want to use https to update plugins and treesitter parsers.
settings["use_ssh"] = true

-- Set it to false if there are no need to format on save.
settings["format_on_save"] = true

-- Set it to false if diagnostics virtual text is annoying for you
---@type string
settings["diagnostics_virtual_text_severity_limit"] = "Warning"
-- Set the format disabled directories here, files under these dirs won't be formatted on save.
settings["format_disabled_dirs"] = {
	home .. "/format_disabled_dir_under_home",
}

-- NOTE: The startup time will be slowed down when it's true.
-- Set it to false if you don't use nvim to open big files.
settings["load_big_files_faster"] = true

---Change the colors of the global palette here.
---Settings will complete their replacement at initialization.
---Parameters will be automatically completed as you type.
---Example: { sky = "#04A5E5" }
---@type palette
settings["palette_overwrite"] = {}

-- Set the colorscheme to use here.
-- Available values are: `catppuccin`, `gruvbox`.
settings["colorscheme"] = "gruvbox"

-- Set background color to use here.
-- Useful for when you want to use a colorscheme that has a light and dark variant like `edge`.
-- Available values are: `dark`, `light`.
settings["background"] = "dark"

-- Set the command for handling external URLs here. The executable must be available on your $PATH.
-- This entry is IGNORED on Windows and macOS, which have their default handlers builtin.
---@type string
settings["external_browser"] = "chrome-cli open"

-- Filetypes in this list will skip lsp formatting if rhs is true
---@type table<string, boolean>
settings["formatter_block_list"] = {
	lua = false, -- example
}

-- Servers in this list will skip setting formatting capabilities if rhs is true
---@type table<string, boolean>
settings["server_formatting_block_list"] = {
	lua_ls = true,
	tsserver = true,
	clangd = true,
	pylsp = true,
}

-- Set the language servers that will be installed during bootstrap here
-- check the below link for all the supported LSPs:
-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations
settings["lsp"] = {
	"bashls",
	"clangd",
	"html",
	"jsonls",
	"lua_ls",
	"jedi_language_server",
	"gopls",
	"pylsp",
	"cspell",
}

-- Set the desired non-LSP sources here.
-- check the below link for all supported non-LSP sources
-- in `code_actions`, `completion`, `diagnostics`, `formatting`, `hover` folders:
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins
settings["null_ls"] = {
	-- formatting
	"black",
	"clang_format",
	"eslint_d",
	"jq",
	"markdownlint",
	"prettierd",
	"rustfmt",
	"shfmt",
	"stylua",
	"goimports",
	"golines",
	"prettier",

	-- diagnostics
	"shellcheck",
	"golangci_lint",
	"cspell",
	-- "markdownlint",
}

return settings
