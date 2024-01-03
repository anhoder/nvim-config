local home = vim.fn.expand("$HOME")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          settings = {
            intelephense = {
              environment = {
                includePaths = { home .. "/Desktop/www/yii/" },
              },
            },
          },
          autostart = true,
        },
        phpactor = {
          filetypes = { "php" },
          init_options = {
            ["language_server.diagnostics_on_open"] = false,
            ["language_server.diagnostics_on_save"] = false,
            ["language_server.diagnostics_on_update"] = false,
          },
          autostart = false,
        },
        gopls = {
          settings = {
            gopls = {
              buildFlags = { "-tags=wireinject" },
            },
          },
        },
      },
    },
  },
}
