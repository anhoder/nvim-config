-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Resize window using <ctrl> arrow keys
map({ "n", "i", "v" }, "<C-D-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map({ "n", "i", "v" }, "<C-D-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map({ "n", "i", "v" }, "<C-D-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map({ "n", "i", "v" }, "<C-D-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move to window using the <ctrl> hjkl keys
map({ "n", "i", "v" }, "<C-A-Left>", "<C-w>h", { desc = "Go to left window", remap = true })
map({ "n", "i", "v" }, "<C-A-Down>", "<C-w>j", { desc = "Go to lower window", remap = true })
map({ "n", "i", "v" }, "<C-A-Up>", "<C-w>k", { desc = "Go to upper window", remap = true })
map({ "n", "i", "v" }, "<C-A-Right>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Copy, paste, cut
map({ "n", "v" }, "<D-c>", '"+y', { desc = "Copy", noremap = true })
map({ "n", "v" }, "<D-v>", '"+p', { desc = "Paste", noremap = true })
map({ "n", "v" }, "<D-x>", '"+x', { desc = "Cut", noremap = true })
map("i", "<D-c>", "<C-r>+", { desc = "Paste", noremap = true })

-- Move to beginning/end of line
map({ "n", "v", "i" }, "<D-Left>", "<Home>", { desc = "Beginning of line" })
map({ "n", "v", "i" }, "<D-Right>", "<End>", { desc = "End of line" })

-- Select
map({ "n", "i", "v" }, "<D-S-Left>", "<Esc>v<Home>", { desc = "Select to beginning of line" })
map({ "n", "i", "v" }, "<D-S-Right>", "<Esc>v<End>", { desc = "Select to end of line" })

-- Comment
map({ "i", "n" }, "<D-/>", function()
  return "<Esc>" .. MiniComment.operator() .. "_"
end, { expr = true, desc = "Comment" })
map("v", "<D-/>", [[:<c-u>lua MiniComment.operator('visual')<cr>]], { desc = "Comment selection" })

-- Document symbols
map({ "i", "n", "v" }, "<D-m>", function()
  require("telescope.builtin").lsp_document_symbols({ symbols = require("lazyvim.config").get_kind_filter() })
end, { desc = "Document symbols" })
