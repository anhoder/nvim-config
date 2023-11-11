-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local Terminal = require("toggleterm.terminal").Terminal
local term1 = Terminal:new({ display_name = "term1", direction = "float", float_opts = { border = "curved" } })
local term2 = Terminal:new({ display_name = "term2", direction = "float", float_opts = { border = "curved" } })
local term3 = Terminal:new({ display_name = "term3", direction = "float", float_opts = { border = "curved" } })
local musicfox = Terminal:new({
  cmd = "musicfox",
  display_name = "musicfox",
  hidden = true,
  direction = "float",
  float_opts = { border = "curved" },
})
local lazygit = Terminal:new({
  cmd = "lazygit",
  display_name = "lazygit",
  hidden = true,
  direction = "float",
  float_opts = { border = "curved" },
})

-- n normal, i insert, v visual, s select, c command, t terminal, o operator pending

-- Resize window using <ctrl> arrow keys
map({ "n", "i", "v", "t" }, "<C-D-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map({ "n", "i", "v", "t" }, "<C-D-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map({ "n", "i", "v", "t" }, "<C-D-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map({ "n", "i", "v", "t" }, "<C-D-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

map({ "n", "i", "v", "t" }, "<C-D-S-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map({ "n", "i", "v", "t" }, "<C-D-S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map({ "n", "i", "v", "t" }, "<C-D-S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map({ "n", "i", "v", "t" }, "<C-D-S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move to window using the <ctrl> hjkl keys
map({ "n", "i", "v", "t" }, "<C-A-Left>", "<Esc><Esc><C-w>h", { desc = "Go to left window", remap = true })
map({ "n", "i", "v", "t" }, "<C-A-Down>", "<Esc><Esc><C-w>j", { desc = "Go to lower window", remap = true })
map({ "n", "i", "v", "t" }, "<C-A-Up>", "<Esc><Esc><C-w>k", { desc = "Go to upper window", remap = true })
map({ "n", "i", "v", "t" }, "<C-A-Right>", "<Esc><Esc><C-w>l", { desc = "Go to right window", remap = true })

map({ "n", "i", "v", "t" }, "<C-A-S-Left>", "<Esc><C-w>h", { desc = "Go to left window", remap = true })
map({ "n", "i", "v", "t" }, "<C-A-S-Down>", "<Esc><C-w>j", { desc = "Go to lower window", remap = true })
map({ "n", "i", "v", "t" }, "<C-A-S-Up>", "<Esc><C-w>k", { desc = "Go to upper window", remap = true })
map({ "n", "i", "v", "t" }, "<C-A-S-Right>", "<Esc><C-w>l", { desc = "Go to right window", remap = true })

-- Save
map({ "n", "i", "v" }, "<D-s>", "<cmd>w<cr><Esc>", { desc = "Save" })
map({ "n", "i", "v", "s", "c" }, "<D-z>", "<cmd>undo<cr>", { desc = "Undo" })
map({ "n", "i", "v", "s", "c" }, "<D-S-z>", "<cmd>redo<cr>", { desc = "Redo" })

-- Dup one line
map({ "n", "v" }, "<D-d>", "<Esc>yyp", { desc = "Paste", noremap = true })
map({ "i" }, "<D-d>", "<Esc>yypi", { desc = "Paste", noremap = true })

-- Copy, paste, cut
map({ "n", "v" }, "<D-c>", '"+y', { desc = "Copy", noremap = true })
map({ "n", "v" }, "<D-v>", '"+p', { desc = "Paste", noremap = true })
map({ "t" }, "<D-v>", '<cmd>stopinsert<cr>"+pi', { desc = "Paste", noremap = true })
map({ "n", "v" }, "<D-x>", '"+x', { desc = "Cut", noremap = true })
map({ "i", "c" }, "<D-v>", "<cmd>set paste<cr><C-r>+<cmd>set nopaste<cr>", { desc = "Paste", noremap = true })

map({ "n", "v" }, "<D-S-c>", '"+y', { desc = "Copy", noremap = true })
map({ "n", "v" }, "<D-S-v>", '"+p', { desc = "Paste", noremap = true })
map({ "t" }, "<D-S-v>", '<cmd>stopinsert<cr>"+pi', { desc = "Paste", noremap = true })
map({ "n", "v" }, "<D-S-x>", '"+x', { desc = "Cut", noremap = true })
map({ "i", "c" }, "<D-S-v>", "<cmd>set paste<cr><C-r>+<cmd>set nopaste<cr>", { desc = "Paste", noremap = true })

-- Move to beginning/end of line
map({ "n", "v" }, "<D-Left>", "^", { desc = "Beginning of line" })
map({ "n", "v" }, "<D-Right>", "$", { desc = "End of line" })
map({ "i" }, "<D-Left>", "<Esc>^i", { desc = "Beginning of line" })
map({ "i" }, "<D-Right>", "<Esc>$a", { desc = "End of line" })

-- Select
map({ "n", "i", "v" }, "<D-S-Left>", "<Esc>v^", { desc = "Select to beginning of line" })
map({ "n", "i", "v" }, "<D-S-Right>", "<Esc>v$", { desc = "Select to end of line" })

-- Comment
map({ "i", "n" }, "<D-/>", function()
  return "<Esc>" .. MiniComment.operator() .. "_"
end, { expr = true, desc = "Comment" })
map("v", "<D-/>", [[:<c-u>lua MiniComment.operator('visual')<cr>]], { desc = "Comment selection" })

-- Document symbols
map({ "i", "n", "v" }, "<D-m>", function()
  require("telescope.builtin").lsp_document_symbols({ symbols = require("lazyvim.config").get_kind_filter() })
end, { desc = "Document symbols" })

-- Terminal
map({ "i", "n", "v", "t" }, "<D-`>", "<Esc><cmd>ToggleTerm size=30<cr>", { desc = "Open terminal" })
map({ "i", "n", "v", "t" }, "<D-1>", function()
  vim.cmd("stopinsert")
  term1:toggle()
  vim.cmd("startinsert")
end, { desc = "Open terminal 1" })
map({ "i", "n", "v", "t" }, "<D-2>", function()
  vim.cmd("stopinsert")
  term2:toggle()
  vim.cmd("startinsert")
end, { desc = "Open terminal 2" })
map({ "i", "n", "v", "t" }, "<D-3>", function()
  vim.cmd("stopinsert")
  term3:toggle()
  vim.cmd("startinsert")
end, { desc = "Open terminal 3" })

-- musicfox
map("n", "<leader>mf", function()
  musicfox:toggle()
  vim.cmd("startinsert")
end, { desc = "Run musicfox" })

map({ "i", "n", "v", "t" }, "<D-Esc>", function()
  vim.cmd("stopinsert")
  musicfox:toggle()
  vim.cmd("startinsert")
end, { desc = "Run musicfox" })

-- lazygit
map("n", "<leader>gg", function()
  lazygit:toggle()
  vim.cmd("startinsert")
end, { desc = "Run lazygit" })

-- Increase, Decrease Font size
local change_font_size = function(delta)
  return function()
    vim.g.guifontsize = vim.g.guifontsize + delta
    vim.cmd("set guifont=" .. vim.g.guifont .. ":h" .. vim.g.guifontsize)
  end
end
map({ "i", "n", "v", "s", "t", "o" }, "<C-=>", change_font_size(1), { desc = "Increase font size" })
map({ "i", "n", "v", "s", "t", "o" }, "<C-->", change_font_size(-1), { desc = "Increase font size" })

map({ "i", "n", "v", "s", "t", "o" }, "<D-=>", change_font_size(1), { desc = "Increase font size" })
map({ "i", "n", "v", "s", "t", "o" }, "<D-->", change_font_size(-1), { desc = "Increase font size" })
