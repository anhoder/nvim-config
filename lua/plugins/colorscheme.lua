return {
  -- add gruvbox
  -- { "ellisonleao/gruvbox.nvim" },
  { "morhetz/gruvbox" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
