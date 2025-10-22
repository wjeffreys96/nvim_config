vim.g.rustaceanvim = {
  -- Plugin configuration
  tools = {},
  -- LSP configuration
  server = {
    on_attach = function(client, bufnr)
      -- you can also put keymaps in here
    end,
    default_settings = {
      -- rust-analyzer language server configuration
      ["rust-analyzer"] = {
        cargo = {
          allTargets = false,
          allFeatures = true,
        },
      },
    },
  },
  -- DAP configuration
  dap = {},
}

return {
  'mrcjkb/rustaceanvim',
  version = '^6',
  lazy = false, -- This plugin is already lazy
}
