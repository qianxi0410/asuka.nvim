return function()
	local nvim_lsp = require("lspconfig")
	local mason = require("mason")
	local mason_lspconfig = require("mason-lspconfig")

	require("lspconfig.ui.windows").default_options.border = "single"

	local icons = {
		ui = require("modules.utils.icons").get("ui", true),
		misc = require("modules.utils.icons").get("misc", true),
	}

	mason.setup({
		ui = {
			border = "rounded",
			icons = {
				package_pending = icons.ui.Modified_alt,
				package_installed = icons.ui.Check,
				package_uninstalled = icons.misc.Ghost,
			},
			keymaps = {
				toggle_server_expand = "<CR>",
				install_server = "i",
				update_server = "u",
				check_server_version = "c",
				update_all_servers = "U",
				check_outdated_servers = "C",
				uninstall_server = "X",
				cancel_installation = "<C-c>",
			},
		},
	})
	mason_lspconfig.setup({
		ensure_installed = {
			"bashls",
			"clangd",
			"gopls",
			"pyright",
			"sumneko_lua",
		},
	})

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

	local opts = {
		on_attach = function()
			require("lsp_signature").on_attach({
				bind = true,
				use_lspsaga = false,
				floating_window = true,
				fix_pos = true,
				hint_enable = true,
				hi_parameter = "Search",
				handler_opts = {
					border = "rounded",
				},
			})
		end,
		capabilities = capabilities,
	}

	mason_lspconfig.setup_handlers({
		function(server)
			require("lspconfig")[server].setup({
				capabilities = opts.capabilities,
				on_attach = opts.on_attach,
			})
		end,

		bashls = function()
			local _opts = require("completion.servers.bashls")
			local final_opts = vim.tbl_deep_extend("keep", _opts, opts)
			nvim_lsp.bashls.setup(final_opts)
		end,

		clangd = function()
			local _capabilities = vim.tbl_deep_extend("keep", { offsetEncoding = { "utf-16", "utf-8" } }, capabilities)
			local _opts = require("completion.servers.clangd")
			local final_opts =
				vim.tbl_deep_extend("keep", _opts, { on_attach = opts.on_attach, capabilities = _capabilities })
			nvim_lsp.clangd.setup(final_opts)
		end,

		gopls = function()
			local _opts = require("completion.servers.gopls")
			local final_opts = vim.tbl_deep_extend("keep", _opts, opts)
			nvim_lsp.gopls.setup(final_opts)
		end,

		jsonls = function()
			local _opts = require("completion.servers.jsonls")
			local final_opts = vim.tbl_deep_extend("keep", _opts, opts)
			nvim_lsp.jsonls.setup(final_opts)
		end,

		sumneko_lua = function()
			local _opts = require("completion.servers.sumneko_lua")
			local final_opts = vim.tbl_deep_extend("keep", _opts, opts)
			nvim_lsp.sumneko_lua.setup(final_opts)
		end,
	})

	if vim.fn.executable("html-languageserver") then
		local _opts = require("completion.servers.html")
		local final_opts = vim.tbl_deep_extend("keep", _opts, opts)
		nvim_lsp.html.setup(final_opts)
	end

	-- null-ls
	local null_ls = require("null-ls")
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	local lsp_formatting = function(bufnr)
		vim.lsp.buf.format({
			filter = function(client)
				-- only use null-ls for formatting
				return client.name == "null-ls"
			end,
			bufnr = bufnr,
		})
	end

	null_ls.setup({
		sources = {
			-- formatting see: https://github.com/jose-elias-alvarez/null-ls.nvim
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.clang_format,
			null_ls.builtins.formatting.eslint, -- prefer to use eslint to format
			null_ls.builtins.formatting.shfmt,
			null_ls.builtins.formatting.rustfmt,
			null_ls.builtins.formatting.gofumpt,
			null_ls.builtins.formatting.goimports,
			null_ls.builtins.formatting.golines,
			null_ls.builtins.formatting.prettier,

			null_ls.builtins.diagnostics.eslint,
			null_ls.builtins.diagnostics.golangci_lint,
			-- null_ls.builtins.diagnostics.cspell,
		},
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						lsp_formatting(bufnr)
					end,
				})
			end
		end,
	})
end
