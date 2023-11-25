---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<Esc>"] = "",
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

M.lspsaga = {
  n = {
    ["<leader>ca"] = { "<cmd>Lspsaga code_action<cr>", "code action" },
    ["K"] = { "<cmd>Lspsaga hover_doc<cr>", "hover doc" },
    ["<leader>cn"] = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "next diagnostic" },
    ["<leader>cp"] = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "prev diagnostic" },
    ["<leader>ra"] = { "<cmd>Lspsaga rename<cr>", "rename" },
    ["<leader>cd"] = { "<cmd>Lspsaga peek_definition<cr>", "peek definition" },
    ["<leader>gR"] = { "<cmd>Lspsaga finder ref<cr>", "glance reference" },
    ["<leader>gD"] = { "<cmd>Lspsaga finder def<cr>", "glance def" },
    ["<leader>gT"] = { "<cmd>Lspsaga finder tyd<cr>", "glance type definition" },
    ["<leader>gI"] = { "<cmd>Lspsaga finder imp<cr>", "glance implement" },
    ["<leader>co"] = { "<cmd>Lspsaga outline<cr>", "outline" },
    ["<leader>ct"] = { "<cmd>Lspsaga term_toggle<cr>", "terminal" },
  },
}

M.spectre = {
  n = {
    ["<leader>sr"] = { "<cmd>lua require('spectre').open()<cr>", "replace" },
    ["<leader>sf"] = { "<cmd>lua require('spectre').open_file_search()<cr>", "file search" },
    ["<leader>sw"] = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "visual replace" },
    ["<leader>rr"] = { "<cmd>lua require('spectre.actions').run_replace()<cr>", "run replace" },
  },
}

M.hop = {
  n = {
    ["<leader>hw"] = { "<cmd>HopWord<cr>", "hop word" },
    ["<leader>j"] = { "<cmd>HopLine<cr>", "hop line" },
    ["<leader>k"] = { "<cmd>HopLineStart<cr>", "hop line start" },
    ["<leader>hp"] = { "<cmd>HopPattern<cr>", "hop pattern" },
    -- actually, we don't need clever-f anymore
    ["f"] = { "<cmd>HopChar1<cr>", "hop char1" },
    ["<leader>hc"] = { "<cmd>HopChar2<cr>", "hop char2" },
    ["<leader>ha"] = { "<cmd>HopAnywhere<cr>", "hop anywhere" },
  },
}

M.telescope = {
  n = {
    ["<leader>fd"] = { "<cmd>Telescope file_browser<cr>", "File browser" },
    ["<leader>fr"] = { "<cmd>Telescope frecency<cr>", "Find frecencfrecencyy" },
  },
}

M.dap = {
  n = {
    ["<leader>b"] = { "<cmd>DapToggleBreakpoint<cr>", "Add breakpoint" },
    ["<F5>"] = { "<cmd>:Telescope dap configurations<cr>", "Continue debug" },
    ["<F6>"] = { "<cmd>DapStepOver<cr>", "Step over" },
    ["<F7>"] = { "<cmd>DapStepInto<cr>", "Step into" },
    ["<F8>"] = { "<cmd>DapStepOut<cr>", "Step out" },
    ["<leader>ds"] = { "<cmd>DapStop<cr>", "Dap stop" },
    ["<leader>dt"] = { "<cmd>DapTerminate", "Dap terminate" },
    ["<leader>dr"] = { "<cmd>DapToggleRepl<cr>", "Open REPL" },
    ["<leader>db"] = { "<cmd>Telescope dap list_breakpoints<cr>", "List breakpoints" },
  },
}

M.neotest = {
  n = {
    ["<leader>ts"] = { "<cmd>lua require('neotest').summary.open()<cr>", "test summary open" },
    ["<leader>tx"] = { "<cmd>lua require('neotest').summary.close()<cr>", "test summary close" },
    ["<leader>tf"] = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "test file" },
    ["<leader>tc"] = { "<cmd>lua require('neotest').run.run()<cr>", "test current" },
    ["<leader>tt"] = { "<cmd>lua require('neotest').run.stop()<cr>", "test stop" },
  },
}

M.legendary = {
  n = {
    ["<C-p>"] = { "<cmd>Legendary<cr>", "legendary run" },
  },
}

M.yanky = {
  n = {
    ["<leader>p"] = { "<cmd>:Telescope yank_history<cr>", "yank history" },
  },
}

return M
