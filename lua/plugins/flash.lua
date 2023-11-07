return {
  "folke/flash.nvim",
  ---@type Flash.Config
  opts = {
    modes = {
      search = {
        enabled = false,
      },
    },
  },
  keys = {
    -- disable the default flash keymap
    { "s", mode = { "n", "x", "o" }, false },
  },
}
