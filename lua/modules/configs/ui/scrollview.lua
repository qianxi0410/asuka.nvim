return function()
	require("scrollview").setup({
		scrollview_mode = "virtual",
		excluded_filetypes = { "NvimTree", "terminal", "nofile" },
		winblend = 55,
		signs_on_startup = { "search", "spell", "folds", "marks" },
	})
end
