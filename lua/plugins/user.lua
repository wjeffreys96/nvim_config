---@type LazySpec
return {
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
    event = { "BufReadPost", "BufNewFile" },
    ft = "typescript",
  },
}
