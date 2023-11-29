local bufferline = require("bufferline")
local state = require("hbac.state")
return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      style_preset = bufferline.style_preset.default,
      themable = true,
      separator_style = "slope",
      sort_by = "id",
      hover = {
        enabled = true,
        delay = 50,
        reveal = { "close" },
      },
      name_formatter = function(buf)
        if state.is_pinned(buf.bufnr) then
          return "*" .. buf.name
        end
        return buf.name
      end,
    },
    highlights = {
      indicator_selected = {
        fg = "#61B0D8",
      },
    },
  },
}
