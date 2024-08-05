local lspconfig = require("lspconfig")

return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        ruby_lsp = {
          enabled = false,
        },
        solargraph = {
          enabled = true,
          root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
          settings = {
            solargraph = {
              autoformat = true,
              completion = true,
              diagnostics = true,
              folding = true,
              references = true,
              rename = true,
              symbols = true,
            },
          },
        },
        rubocop = {
          enabled = true,
          root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
        },
        standardrb = {
          enabled = false,
        },
      },
    },
  },
}
