local bufferline = require("bufferline")
return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      style_preset = bufferline.style_preset.default,
      themable = true,
      separator_style = "slope",
    },
    highlights = {
      indicator_selected = {
        fg = "#61B0D8",
      },
    },
  },
}
