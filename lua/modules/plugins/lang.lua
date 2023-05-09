local lang = {}

-- lang["fatih/vim-go"] = {
-- 	lazy = true,
-- 	ft = "go",
-- 	build = ":GoInstallBinaries",
-- 	config = require("lang.vim-go"),
-- }
lang["ray-x/go.nvim"] = {
	dependencies = { -- optional packages
		"ray-x/guihua.lua",
	},
	config = require("lang.go"),
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()', -- if
}
lang["simrat39/rust-tools.nvim"] = {
	lazy = true,
	ft = "rust",
	config = require("lang.rust-tools"),
	dependencies = { "nvim-lua/plenary.nvim" },
}
lang["Saecki/crates.nvim"] = {
	lazy = true,
	event = "BufReadPost Cargo.toml",
	config = require("lang.crates"),
	dependencies = { "nvim-lua/plenary.nvim" },
}
lang["iamcco/markdown-preview.nvim"] = {
	lazy = true,
	ft = "markdown",
	build = ":call mkdp#util#install()",
}
lang["chrisbra/csv.vim"] = {
	lazy = true,
	ft = "csv",
}
return lang
