-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.o.guifont = "ComicMono NF:h16"
vim.opt.linespace = 2
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.g.neovide_transparency = 0.95
vim.g.transparency = 0.95
vim.g.neovide_confirm_quit = true
vim.g.neovide_remember_window_size = true
vim.g.neovide_cursor_animate_in_insert_mode = true
vim.g.neovide_cursor_animate_command_line = true
-- vim.g.neovide_cursor_vfx_mode = "pixiedust"
-- vim.g.neovide_cursor_vfx_particle_density = 15.0
vim.g.neovide_fullscreen = true
vim.g.neovide_input_macos_alt_is_meta = true
