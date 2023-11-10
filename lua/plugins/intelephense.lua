return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {},
        -- phpactor = {
        --   filetypes = { "php", "blade" },
        --   init_options = {
        --     ["language_server.diagnostics_on_open"] = false,
        --     ["language_server.diagnostics_on_save"] = false,
        --     ["language_server.diagnostics_on_update"] = false,
        --   },
        -- },
      },
    },
  },
}
