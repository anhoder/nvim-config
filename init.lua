-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.g.guifont = "FiraCode\\ Nerd\\ Font\\ Mono"
vim.g.guifontsize = 15

vim.opt.guifont = vim.g.guifont .. ":h" .. vim.g.guifontsize
-- vim.opt.linespace = 6
-- vim.opt.guifont = "ComicMono NF:h16"
-- vim.opt.guifont = "MesloLGLDZ Nerd Font Mono:h15"
-- vim.opt.fileencoding = "utf-8"
vim.opt.filetype = "on"
vim.opt.ignorecase = true
vim.opt.sessionoptions = "buffers,curdir,folds,globals,tabpages,terminal"
vim.opt.swapfile = false
vim.opt.autoindent = false
vim.opt.smartindent = false
vim.opt.winblend = 10
vim.opt.pumblend = 10
vim.opt.mousemoveevent = true

vim.g.minimap_auto_start = 1
vim.g.minimap_auto_start_win_enter = 1

vim.g.neovide_scale_factor = 1.0
vim.g.neovide_transparency = 0.0
vim.g.neovide_background_color = "#353535" .. "e5"
vim.g.neovide_scroll_animation_far_lines = 0

-- vim.g.neovide_hide_mouse_when_typing = true
-- vim.g.neovide_cursor_animation_length = 0.2
vim.g.neovide_cursor_trail_size = 0.5
vim.g.neovide_refresh_rate_idle = 60
vim.g.neovide_confirm_quit = true
vim.g.neovide_remember_window_size = true
vim.g.neovide_cursor_animate_in_insert_mode = true
vim.g.neovide_cursor_animate_command_line = true
-- vim.g.neovide_cursor_vfx_mode = "pixiedust"
-- vim.g.neovide_cursor_vfx_particle_density = 15.0
vim.g.neovide_fullscreen = false
vim.g.neovide_input_macos_alt_is_meta = true
