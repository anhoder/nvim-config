local home = vim.fn.expand("$HOME")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          on_init = function(client)
            client.server_capabilities.documentFormattingProvider = false
          end,
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
      },
    },
  },
}
