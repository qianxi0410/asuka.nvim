return function()
	local null_ls = require("null-ls")
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
	local mason_null_ls = require("mason-null-ls")
	local btns = null_ls.builtins

	local lsp_formatting = function(bufnr)
		vim.lsp.buf.format({
			filter = function(client)
				-- only use null-ls for formatting
				return client.name == "null-ls"
			end,
			bufnr = bufnr,
		})
	end

	mason_null_ls.setup({
		ensure_installed = require("core.settings").null_ls_deps,
		automatic_installation = false,
		automatic_setup = true,
		handlers = {},
	})

	local sources = {
		-- formatting see: https://github.com/jose-elias-alvarez/null-ls.nvim
		btns.formatting.stylua,
		btns.formatting.clang_format,
		btns.formatting.eslint, -- prefer to use eslint to format
		btns.formatting.shfmt,
		btns.formatting.rustfmt,
		btns.formatting.goimports,
		btns.formatting.golines.with({
			extra_args = {
				"--max-len=180",
				"--base-formatter=gofumpt",
			},
		}),
		btns.formatting.prettier,

		btns.diagnostics.eslint,
		btns.diagnostics.golangci_lint,
		btns.diagnostics.cspell.with({
			diagnostics_postprocess = function(diagnostic)
				diagnostic.severity = vim.diagnostic.severity["HINT"]
			end,
			condition = function()
				return vim.fn.executable("cspell") > 0
			end,
			diagnostic_config = {
				underline = true,
				virtual_text = false,
				signs = false,
				update_in_insert = false,
				severity_sort = true,
			},
		}),

		btns.code_actions.cspell,
	}

	null_ls.setup({
		sources = sources,
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
