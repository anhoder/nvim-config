-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- auto focus
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

-- auto format
local auto_format = vim.api.nvim_create_augroup("AutoFormat", { clear = true })
local ignore_format_filetypes = { "php" }
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = auto_format,
  pattern = ignore_format_filetypes,
  callback = function()
    vim.b.autoformat = false
  end,
})

-- vim startup
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

-- PersistedLoadPost
local persisted_load_group = vim.api.nvim_create_augroup("autopin", {})
vim.api.nvim_create_autocmd({ "User" }, {
  pattern = "PersistedLoadPost",
  group = persisted_load_group,
  callback = function()
    -- auto pin all
    require("hbac.command.actions").pin_all()

    -- delete last buffers(neo-tree)
    local buflist = require("hbac.utils").get_listed_buffers()
    if #buflist > 0 then
      require("mini.bufremove").delete(buflist[#buflist], false)
    end

    -- manually load launch.json
    require("dap.ext.vscode").load_launchjs()
  end,
})

-- lsp inlayhints
local inlay_group = vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = inlay_group,
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require("lsp-inlayhints").on_attach(client, bufnr)
  end,
})
