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
            -- ["language_server.diagnostics_on_open"] = false,
            -- ["language_server.diagnostics_on_save"] = false,
            -- ["language_server.diagnostics_on_update"] = false,
            ["language_server_worse_reflection.inlay_hints.enable"] = true,
            ["language_server_worse_reflection.inlay_hints.types"] = true,
            ["language_server_worse_reflection.inlay_hints.params"] = true,
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
