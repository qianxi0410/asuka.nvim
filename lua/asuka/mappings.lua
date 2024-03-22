local M = {}

-- 设置空格为 leader key, 不要用 <space>
vim.g.mapleader = " "

-- h: map-table

M.common = {
  { { "n", "i", "v" }, "<C-s>", "<esc><cmd>write<cr>", { desc = "Save file" } }, -- 先 <esc> 是插入模式下的异步格式化有问题
  { { "n", "i", "v" }, "<C-z>", "<cmd>undo<cr><esc>", { desc = "Undo" } },
  { { "n", "i", "v" }, "<C-r>", "<cmd>redo<cr><esc>", { desc = "Redo" } },
  { { "n" }, "<C-x>", "<cmd>bdelete<cr>", { desc = "Close current buffer" } },
  { { "n", "i", "v" }, "<C-w>left", "<C-w>h", { desc = "Change window to left" } },
  { { "n", "i", "v" }, "<C-w>right", "<C-w>l", { desc = "Change window to right" } },
  { { "n", "i", "v" }, "<C-w>up", "<C-w>k", { desc = "Change window to up" } },
  { { "n", "i", "v" }, "<C-w>down", "<C-w>j", { desc = "Change window to down" } },
}

M.lspsaga = {
  {
    { "n" },
    "<leader>ca",
    "<cmd>Lspsaga code_action<cr>",
    { desc = "Lspsaga code action" },
  },
  {
    { "n" },
    "<leader>pd",
    "<cmd>Lspsaga peek_definition<cr>",
    { desc = "Lspsaga peek definition" },
  },
  {
    { "n" },
    "<leader>ptd",
    "<cmd>Lspsaga peek_type_definition<cr>",
    { desc = "Lspsaga peek type definition" },
  },
  {
    { "n" },
    "<leader>gd",
    "<cmd>Lspsaga goto_definition<cr>",
    { desc = "Lspsaga goto definition" },
  },
  {
    { "n" },
    "<leader>gtd",
    "<cmd>Lspsaga goto_type_definition<cr>",
    { desc = "Lspsaga goto type definition" },
  },
  {
    { "n" },
    "<leader>o",
    "<cmd>Lspsaga outline<cr>",
    { desc = "Lspsaga outline" },
  },
  {
    { "n" },
    "<leader>tt",
    "<cmd>Lspsaga term_toggle<cr>",
    { desc = "Lspsaga toggle terminal" },
  },
  {
    { "n" },
    "K",
    "<cmd>Lspsaga hover_doc<cr>",
    { desc = "Lspsaga hover doc" },
  },
  {
    { "n" },
    "<leader>r",
    "<cmd>Lspsaga rename<cr>",
    { desc = "Lspsaga rename" },
  },
  {
    { "n" },
    "<leader>dj",
    "<cmd>Lspsaga diagnostic_jump_next<cr>",
    { desc = "Lspsaga jump next diagnostic" },
  },
  {
    { "n" },
    "<leader>dk",
    "<cmd>Lspsaga diagnostic_jump_prev<cr>",
    { desc = "Lspsaga jump prev diagnostic" },
  },
}

M.aerial = { { { "n" }, "<leader>a", "<cmd>Telescope aerial<cr>", { desc = "Aerial toggle" } } }

M.bufferline = {
  { { "n" }, "<leader>bp", "<cmd>BufferLinePick<cr>", { desc = "BufferLinePick" } },
  { { "n" }, "<A-Right>", "<cmd>BufferLineCycleNext<cr>", { desc = "BufferLineCycleNext" } },
  { { "n" }, "<A-Left>", "<cmd>BufferLineCyclePrev<cr>", { desc = "BufferLineCyclePrev" } },
}

M.neotree = {
  { { "n", "i", "v" }, "<C-N>", "<cmd>Neotree toggle<cr>", { desc = "NeoTreeToggle" } },
}

M.treesitter = {
  { { "n" }, "<leader>tn", "<cmd>lua require('tsht').nodes()<cr>", { desc = "Treesitter nodes select" } },
}

M.comment = {
  {
    { "n", "i", "x", "s" },
    "<C-_>",
    "<cmd>lua require('Comment.api').toggle.linewise()<cr>",
    { desc = "CommentLineToggle" },
  },
}

M.telescope = {
  { { "n" }, "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope find files" } },
  { { "n" }, "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Telescope find words" } },
  { { "n" }, "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Telescope buffers" } },
  { { "n" }, "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Telescope help tags" } },
  {
    { "n" },
    "<leader>fz",
    "<cmd>Telescope current_buffer_fuzzy_find<cr>",
    { desc = "Telescope find words in current buffer" },
  },
  { { "n" }, "<leader>fy", "<cmd>Telescope yank_history<cr>", { desc = "Telescope find yank history" } },
  { { "n" }, "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "Telescope find projects" } },

  -- lsp
  { { "n" }, "<leader>fr", "<cmd>Telescope lsp_references<cr>", { desc = "Telescope find ref" } },
  { { "n" }, "<leader>fi", "<cmd>Telescope lsp_implementations<cr>", { desc = "Telescope find imp" } },
  { { "n" }, "<leader>fd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Telescope find def" } },
  { { "n" }, "<leader>ft", "<cmd>Telescope lsp_type_definitions<cr>", { desc = "Telescope find tyd" } },
  { { "n" }, "<leader>ic", "<cmd>Telescope lsp_incoming_calls<cr>", { desc = "Telescope find incoming calls" } },
  { { "n" }, "<leader>oc", "<cmd>Telescope lsp_outgoing_calls<cr>", { desc = "Telescope find outcoming calls" } },

  -- session
  { { "n" }, "<leader>fs", "<cmd>Telescope persisted<cr>", { desc = "Telescope find session" } },

  { { "n" }, "<leader>fu", "<cmd>Telescope undo<cr>", { desc = "Telescope find undo" } },
  { { "n" }, "<C-p>", "<cmd>Telescope keymaps<cr>", { desc = "Telescope find keymap" } },
}

M.spectre = {
  {
    { "n" },
    "<leader>sw",
    "<cmd>lua require('spectre').open_file_search({select_word=true})<cr>",
    { desc = "Spectre select word in file" },
  },
  {
    { "n", "v" },
    "<leader>sf",
    "<cmd>lua require('spectre').open_file_search({})<cr>", -- open_file_search 没有选择单词的功能，但是可以先 v 选中单词，关闭 v 模式后再执行这个命令
    { desc = "Spectre select in file" },
  },
  {
    { "n", "v" },
    "<leader>sr",
    "<cmd>lua require('spectre.actions').run_replace()<cr>",
    { desc = "Spectre run replace" },
  },
}

M.dap = {
  { { "n" }, "<leader>b", "<cmd>lua require('dap').toggle_breakpoint()<cr>", { desc = "Dap toggle breakpoint" } },
  { { "n" }, "<f5>", "<cmd>Telescope dap configurations<cr>", { desc = "Dap configuration" } },
  { { "n" }, "<f6>", "<cmd>DapStepInto<cr>", { desc = "Dap step into" } },
  { { "n" }, "<f7>", "<cmd>DapStepOver<cr>", { desc = "Dap step over" } },
  { { "n" }, "<f8>", "<cmd>DapStepOut<cr>", { desc = "Dap step out" } },
  { { "n" }, "<leader>ds", "<cmd>DapStop<cr>", { desc = "Dap stop" } },
  { { "n" }, "<leader>dt", "<cmd>DapTerminate<cr>", { desc = "Dap terminate" } },
  { { "n" }, "<leader>dr", "<cmd>DapToggleRepl<cr>", { desc = "Dap toggle repl" } },
  { { "n" }, "<leader>dl", "<cmd>Telescope dap list_breakpoints<cr>", { desc = "Dap list breakpoints" } },
}

M.hop = {
  { { "n" }, "<leader>hw", "<cmd>HopWord<cr>", { desc = "Hop word" } },
  { { "n" }, "<leader>j", "<cmd>HopLine<cr>", { desc = "Hop line" } },
  { { "n" }, "<leader>k", "<cmd>HopLineStart<cr>", { desc = "Hop line start" } },
  {
    { "n" },
    "f",
    "<cmd>lua require('hop').hint_char1 { current_line_only = true }<cr>",
    { desc = "Hop char 1", remap = true },
  },
  { { "n" }, "<leader>hc", "<cmd>HopChar2<cr>", { desc = "Hop char 2" } },
  { { "n" }, "<leader>ha", "<cmd>HopAnywhere<cr>", { desc = "Hop anywhere" } },
  { { "n" }, "<leader>hp", "<cmd>HopPattern<cr>", { desc = "Hop pattern" } },
}

M.neotest = {
  { { "n" }, "<leader>to", "<cmd>lua require('neotest').summary.open()<cr>", { desc = "Neotest open" } },
  { { "n" }, "<leader>tc", "<cmd>lua require('neotest').summary.close()<cr>", { desc = "Neotest close" } },
  { { "n" }, "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", { desc = "Neotest file" } },
  { { "n" }, "<leader>tr", "<cmd>lua require('neotest').run.run()<cr>", { desc = "Neotest current" } },
  { { "n" }, "<leader>td", "<cmd>lua require('dap-go').debug_test()<cr>", { desc = "Neotest debug" } },
  { { "n" }, "<leader>ts", "<cmd>lua require('neotest').run.stop()<cr>", { desc = "Neotest stop" } },
  { { "n" }, "<leader>ta", "<cmd>lua require('neotest').run.attach()<cr>", { desc = "Neotest attach" } },
}

M.trouble = {
  { { "n" }, "<leader>dw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { desc = "Trouble lsp workspace" } },
  { { "n" }, "<leader>db", "<cmd>TroubleToggle document_diagnostics<cr>", { desc = "Trouble lsp document" } },
}

M.neogit = {
  { { "n" }, "<leader>gg", "<cmd>Neogit<cr>", { desc = "Neogit" } },
}

for _, plugin in pairs(M) do
  for _, v in ipairs(plugin) do
    vim.keymap.set(v[1], v[2], v[3], v[4])
  end
end

return M
