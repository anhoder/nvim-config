return {
  {
    "olimorris/persisted.nvim",
    opts = {
      autoload = true,
      should_autosave = function()
        return vim.g.persisted_loaded_session ~= ""
      end,
    },
  },
}
