-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local focus = vim.api.nvim_create_augroup("FocusDisable", { clear = true })
local ignore_filetypes = { "neo-tree", "aerial" }
vim.api.nvim_create_autocmd("FileType", {
  group = focus,
  callback = function(_)
    if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
      vim.b.focus_disable = true
      return
    end
    -- if vim.bo.filetype ~= "notify" and vim.bo.filetype ~= "noice" then
    --   vim.notify(vim.bo.filetype)
    -- end

    if string.sub(vim.bo.filetype, 1, 3) == "dap" then
      vim.b.focus_disable = true
      return
    end
    vim.b.focus_disable = false
  end,
  desc = "Disable focus autoresize for FileType",
})

local startup = vim.api.nvim_create_augroup("startup", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
  group = startup,
  pattern = "*",
  callback = function()
    vim.api.nvim_set_current_dir(vim.fn.expand("%:p:h"))
  end,
})
vim.api.nvim_create_autocmd("BufEnter", {
  group = startup,
  pattern = "*",
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
  end,
})

local autopin_group = vim.api.nvim_create_augroup("autopin", {})
vim.api.nvim_create_autocmd({ "User" }, {
  pattern = "PersistedLoadPost",
  group = autopin_group,
  callback = function()
    require("hbac.command.actions").pin_all()
    require("dap.ext.vscode").load_launchjs()
  end,
})
