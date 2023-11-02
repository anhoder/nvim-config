-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Resize window using <ctrl> arrow keys
map("n", "<C-D-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-D-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-D-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-D-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
