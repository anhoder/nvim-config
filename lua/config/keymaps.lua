-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local toggleterm = require("toggleterm.terminal")
local telescope_builtin = require("telescope.builtin")
local Util = require("lazyvim.util")
local neotree_manager = require("neo-tree.sources.manager")
local neotree_render = require("neo-tree.ui.renderer")
local state = require("hbac.state")
local Terminal = toggleterm.Terminal
local term0 = Terminal:new({ display_name = "term0" })
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
local function get_folder_node(tree, node)
  if not tree then
    return nil
  end
  if not node then
    node = tree:get_node()
  end
  if node.type == "directory" then
    return node
  end
  return get_folder_node(tree, tree:get_node(node:get_parent_id()))
end

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

-- Close window
map({ "n", "i", "v", "t" }, "<D-w>", function()
  local bd = require("mini.bufremove").delete
  if vim.bo.modified then
    local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
    if choice == 1 then -- Yes
      vim.cmd.write()
      bd(0)
    elseif choice == 2 then -- No
      bd(0, true)
    end
  else
    bd(0)
  end
end, { desc = "Close buffer" })

-- Save
map({ "n", "i", "v" }, "<D-s>", "<cmd>w<cr><Esc>", { desc = "Save" })
map({ "n", "i", "v", "s", "c" }, "<D-z>", "<cmd>undo<cr>", { desc = "Undo" })
map({ "n", "i", "v", "s", "c" }, "<D-y>", "<cmd>redo<cr>", { desc = "Redo" })

-- Dup one line
--
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

-- Delete a word
map({ "i" }, "<D-BS>", "<C-w>", { desc = "Delete word", noremap = true })
map({ "n" }, "<D-BS>", '"_cb', { desc = "Delete word", noremap = false })
map({ "i", "n" }, "<D-S-BS>", '<Esc>"_ciw', { desc = "Delete a whole word", noremap = false })

-- Move to beginning/end of line
map({ "n", "v" }, "<D-Left>", "^", { desc = "Beginning of line" })
map({ "n" }, "<D-Right>", "$", { desc = "End of line" })
map({ "v" }, "<D-Right>", "$h", { desc = "End of line" })
map({ "i" }, "<D-Left>", "<Esc>^i", { desc = "Beginning of line" })
map({ "i" }, "<D-Right>", "<Esc>$a", { desc = "End of line" })

map({ "n", "v", "i" }, "<A-Left>", "<Esc>zH", { desc = "Scroll to left" })
map({ "n", "v", "i" }, "<A-Right>", "<Esc>zL", { desc = "Scroll to right" })

-- Select
map({ "n", "i", "v" }, "<D-S-Left>", "<Esc>v^", { desc = "Select to beginning of line" })
map({ "n", "i", "v" }, "<D-S-Right>", "<Esc>v$h", { desc = "Select to end of line" })

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
map({ "i", "n", "v", "t" }, "<D-`>", function()
  vim.cmd("stopinsert")
  term0:toggle()
  if term0:is_open() then
    term0:set_mode(toggleterm.mode.INSERT)
  end
end, { desc = "Open terminal" })
map({ "i", "n", "v", "t" }, "<D-1>", function()
  vim.cmd("stopinsert")
  term1:toggle()
  if term1:is_open() then
    term1:set_mode(toggleterm.mode.INSERT)
  end
end, { desc = "Open terminal 1" })
map({ "i", "n", "v", "t" }, "<D-2>", function()
  vim.cmd("stopinsert")
  term2:toggle()
  if term2:is_open() then
    term2:set_mode(toggleterm.mode.INSERT)
  end
end, { desc = "Open terminal 2" })
map({ "i", "n", "v", "t" }, "<D-3>", function()
  vim.cmd("stopinsert")
  term3:toggle()
  if term3:is_open() then
    term3:set_mode(toggleterm.mode.INSERT)
  end
end, { desc = "Open terminal 3" })
map({ "i", "n", "v", "t" }, "<D-S-1>", function()
  vim.cmd("stopinsert")
  term1:toggle()
  if term1:is_open() then
    term1:set_mode(toggleterm.mode.INSERT)
  end
end, { desc = "Open terminal 1" })
map({ "i", "n", "v", "t" }, "<D-S-2>", function()
  vim.cmd("stopinsert")
  term2:toggle()
  if term2:is_open() then
    term2:set_mode(toggleterm.mode.INSERT)
  end
end, { desc = "Open terminal 2" })
map({ "i", "n", "v", "t" }, "<D-S-3>", function()
  vim.cmd("stopinsert")
  term3:toggle()
  if term3:is_open() then
    term3:set_mode(toggleterm.mode.INSERT)
  end
end, { desc = "Open terminal 3" })

-- musicfox
map("n", "<leader>mf", function()
  musicfox:toggle()
  if musicfox:is_open() then
    musicfox:set_mode(toggleterm.mode.INSERT)
  end
end, { desc = "Run musicfox" })

map({ "i", "n", "v", "t" }, "<D-Esc>", function()
  vim.cmd("stopinsert")
  musicfox:toggle()
  if musicfox:is_open() then
    musicfox:set_mode(toggleterm.mode.INSERT)
  end
end, { desc = "Run musicfox" })

-- lazygit
map("n", "<leader>gg", function()
  lazygit:toggle()
  if lazygit:is_open() then
    lazygit:set_mode(toggleterm.mode.INSERT)
  end
end, { desc = "Run lazygit" })

-- fork
map("n", "<leader>gf", function()
  os.execute("fork " .. Util.root())
end, { desc = "Open fork" })

-- Increase, Decrease Font size
local change_font_size = function(delta)
  return function()
    vim.g.guifontsize = vim.g.guifontsize + delta
    local font = string.gsub(vim.g.guifont, " ", "\\ ")
    vim.cmd("set guifont=" .. font .. ":h" .. vim.g.guifontsize)
  end
end
map({ "i", "n", "v", "s", "t", "o" }, "<D-=>", change_font_size(1), { desc = "Increase font size" })
map({ "i", "n", "v", "s", "t", "o" }, "<D-->", change_font_size(-1), { desc = "Decrease font size" })
map({ "i", "n", "v", "s", "t", "o" }, "<D-0>", function()
  vim.cmd("set guifont=" .. vim.g.guifont .. ":h" .. 15)
end, { desc = "Decrease font size" })

-- Scale
local change_scale_factor = function(delta)
  return function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + delta
  end
end
map({ "i", "n", "v", "s", "t", "o" }, "<C-=>", change_scale_factor(0.1), { desc = "Increase scale" })
map({ "i", "n", "v", "s", "t", "o" }, "<C-->", change_scale_factor(-0.1), { desc = "Decrease scale" })
map({ "i", "n", "v", "s", "t", "o" }, "<C-0>", function()
  vim.g.neovide_scale_factor = 1.0
end, { desc = "Reset scale" })

-- GenComment
local neogen = require("neogen")
map({ "n", "v" }, "<leader>cc", function()
  neogen.generate({})
end, { desc = "Gen Comment" })

-- telescope bufffers
map({ "n", "v" }, "<leader>bt", "<cmd>Telescope buffers<cr>", { desc = "Telescope buffers" })
map({ "n", "v" }, "<leader>sg", function()
  telescope_builtin.live_grep({
    glob_pattern = {
      "!vendor/",
      "!node_modules/",
    },
  })
end, { desc = "Telescope Live Grep(ignore vendor/node_modules...)" })
map({ "n", "v" }, "<leader>sG", function()
  local state = neotree_manager.get_state("filesystem")
  if neotree_render.tree_is_visible(state) then
    local dir = get_folder_node(state.tree)
    if dir then
      vim.notify("search in " .. dir.path)
      telescope_builtin.live_grep({ cwd = dir.path })
      return
    end
  end
  vim.notify("search in " .. vim.fn.getcwd())
  telescope_builtin.live_grep()
end, { desc = "Telescope Live Grep(selected or root dir)" })

-- upload to remote
map({ "n", "v", "i" }, "<C-D-u>", function()
  vim.cmd("ARsyncUp")
end, { desc = "Sync up to remote" })
map({ "n", "v", "i" }, "<C-D-d>", function()
  vim.cmd("ARsyncDown")
end, { desc = "Sync down from remote" })

-- open file in finder
map({ "n", "v" }, "<leader>p", function()
  local state = neotree_manager.get_state("filesystem")
  local path = vim.fn.expand("%:p:h")
  if neotree_render.tree_is_visible(state) then
    local node = state.tree:get_node()
    path = node.path
  end

  os.execute("open " .. path)
end, { desc = "Open file in Finder" })

-- pin buffer
map({ "n", "v", "i" }, "<C-p>", function()
  local bufnr = vim.api.nvim_get_current_buf()
  if state.is_pinned(bufnr) then
    return
  end
  state.toggle_pin(bufnr)
end, { desc = "Pin cur buffer" })
