return {
  -- add gruvbox
  -- { "ellisonleao/gruvbox.nvim" },
  { "morhetz/gruvbox" },
  { "lifepillar/vim-gruvbox8" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
