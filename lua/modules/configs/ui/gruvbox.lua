return function()
	require("gruvbox").setup({
		undercurl = false,
		underline = false,
		bold = false,
		italic = {
			strings = true,
			comments = true,
			operators = false,
			folds = true,
		},
		reverse = true,
		strikethrough = false,
		invert_selection = false,
		invert_signs = false,
		invert_tabline = false,
		invert_intend_guides = false,
		inverse = false, -- invert background for search, diffs, statuslines and errors
		contrast = "hard", -- can be "hard", "soft" or empty string
		palette_overrides = {},
		overrides = {
			SignColumn = { bg = "#1d2021" },
			StatusLine = { bg = "#282828", fg = "#ebdbb2" },
			StatusLineNC = { bg = "#1d2021", fg = "#928374" },

			CursorLineNr = { fg = "#ebdbb2", bg = "#282828" },
			CursorLine = { bg = "#282828" },

			Visual = { bg = "#3c3836" },

			GitSignsAdd = { bg = "#1d2021", fg = "#b8bb26" },
			GitSignsChange = { bg = "#1d2021", fg = "#83a598" },
			GitSignsDelete = { bg = "#1d2021", fg = "#fb4934" },

			NormalNC = { bg = nil, fg = "#ebdbb2" },
			NormalFloat = { bg = "#282828", fg = "#ebdbb2" },

			MatchParen = { bg = "#3c3836" },

			-- completion menu
			Pmenu = { bg = "#282828", fg = nil },
			CmpItemAbbr = { fg = "#d5c4a1" },

			DiagnosticSignError = { bg = "#1d2021", fg = "#fb4934" },
			DiagnosticSignWarn = { bg = "#1d2021", fg = "#fabd2f" },
			DiagnosticSignInfo = { bg = "#1d2021", fg = "#83a598" },
			DiagnosticSignHint = { bg = "#1d2021", fg = "#b8bb26" },

			DiagnosticUnderlineHint = { undercurl = true, sp = "#b8bb26" },
			DiagnosticUnderlineInfo = { undercurl = true, sp = "#83a598" },
			DiagnosticUnderlineWarn = { undercurl = true, sp = "#fabd2f" },
			DiagnosticUnderlineError = { undercurl = true, sp = "#fb4934" },
		},
		dim_inactive = false,
		transparent_mode = false,
	})
end
