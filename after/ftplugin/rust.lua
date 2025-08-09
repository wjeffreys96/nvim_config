local bufnr = vim.api.nvim_get_current_buf()
---@diagnostic disable-next-line: missing-parameter
require("crates").setup()
-- Crates
local crates = require "crates"
vim.keymap.set("n", "<leader>rct", crates.toggle, { silent = true, desc = "Toggle" })
vim.keymap.set("n", "<leader>rcr", crates.reload, { silent = true, desc = "Reload" })
vim.keymap.set("n", "<leader>rcv", crates.show_versions_popup, { silent = true, desc = "Show Versions Popup" })
vim.keymap.set("n", "<leader>rcf", crates.show_features_popup, { silent = true, desc = "Show Features Popup" })
vim.keymap.set("n", "<leader>rcd", crates.show_dependencies_popup, { silent = true, desc = "Show Dependencies Popup" })
vim.keymap.set("n", "<leader>rcu", crates.update_crate, { silent = true, desc = "Update Crate" })
vim.keymap.set("v", "<leader>rcu", crates.update_crates, { silent = true, desc = "Update Crates" })
vim.keymap.set("n", "<leader>rca", crates.update_all_crates, { silent = true, desc = "Update All Crates" })
vim.keymap.set("n", "<leader>rcU", crates.upgrade_crate, { silent = true, desc = "Upgrade Crate" })
vim.keymap.set("v", "<leader>rcU", crates.upgrade_crates, { silent = true, desc = "Upgrade Crates" })
vim.keymap.set("n", "<leader>rcA", crates.upgrade_all_crates, { silent = true, desc = "Upgrade All Crates" })
vim.keymap.set("n", "<leader>rcx", crates.expand_plain_crate_to_inline_table, { silent = true, desc = "Expand Plain Crate to Inline Table" })
vim.keymap.set("n", "<leader>rcX", crates.extract_crate_into_table, { silent = true, desc = "Extract Crate Into Table" })
vim.keymap.set("n", "<leader>rcH", crates.open_homepage, { silent = true, desc = "Open Homepage" })
vim.keymap.set("n", "<leader>rcR", crates.open_repository, { silent = true, desc = "Open Repository" })
vim.keymap.set("n", "<leader>rcD", crates.open_documentation, { silent = true, desc = "Open Documentation" })
vim.keymap.set("n", "<leader>rcC", crates.open_crates_io, { silent = true, desc = "Open Crates.io" })
vim.keymap.set("n", "<leader>rcL", crates.open_lib_rs, { silent = true, desc = "Open Lib.rs" })

-- Rustacean
vim.keymap.set("n", "<leader>a", function()
  vim.cmd.RustLsp "codeAction" -- supports rust-analyzer's grouping
  -- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = bufnr })

vim.keymap.set("n", "K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function() vim.cmd.RustLsp { "hover", "actions" } end,
  { silent = true, buffer = bufnr }
)

vim.keymap.set("n", "<leader>lf",
  function() vim.lsp.buf.format() end,
  {silent = true, desc = "Format Buffer"}
)
