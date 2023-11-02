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

map({ "n", "v" }, "<D-c>", '"+y', { desc = "Copy", noremap = true })
map({ "n", "v" }, "<D-v>", '"+p', { desc = "Paste", noremap = true })
map({ "n", "v" }, "<D-x>", '"+x', { desc = "Cut", noremap = true })
map("i", "<D-c>", "<C-r>+", { desc = "Paste", noremap = true })
