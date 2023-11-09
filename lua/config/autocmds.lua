-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local fileType = vim.api.nvim_create_augroup("FileType Settings", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "php" },
  callback = function()
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
    vim.opt.expandtab = true
  end,
  group = fileType,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "js", "jsx", "ts", "tsx", "html", "css", "less", "sass" },
  callback = function()
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
    vim.opt.expandtab = true
  end,
  group = fileType,
})
