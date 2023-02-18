return function()
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
