---@diagnostic disable-next-line: missing-parameter
require("crates").setup()
-- Crates
local crates = require "crates"
vim.keymap.set("n", "<leader>rt", crates.toggle, { silent = true, desc = "Toggle" })
vim.keymap.set("n", "<leader>rr", crates.reload, { silent = true, desc = "Reload" })
vim.keymap.set("n", "<leader>rv", crates.show_versions_popup, { silent = true, desc = "Show Versions Popup" })
vim.keymap.set("n", "<leader>rf", crates.show_features_popup, { silent = true, desc = "Show Features Popup" })
vim.keymap.set("n", "<leader>rd", crates.show_dependencies_popup, { silent = true, desc = "Show Dependencies Popup" })
vim.keymap.set("n", "<leader>ru", crates.update_crate, { silent = true, desc = "Update Crate" })
vim.keymap.set("v", "<leader>ru", crates.update_crates, { silent = true, desc = "Update Crates" })
vim.keymap.set("n", "<leader>ra", crates.update_all_crates, { silent = true, desc = "Update All Crates" })
vim.keymap.set("n", "<leader>rU", crates.upgrade_crate, { silent = true, desc = "Upgrade Crate" })
vim.keymap.set("v", "<leader>rU", crates.upgrade_crates, { silent = true, desc = "Upgrade Crates" })
vim.keymap.set("n", "<leader>rA", crates.upgrade_all_crates, { silent = true, desc = "Upgrade All Crates" })
vim.keymap.set("n", "<leader>rx", crates.expand_plain_crate_to_inline_table, { silent = true, desc = "Expand Plain Crate to Inline Table" })
vim.keymap.set("n", "<leader>rX", crates.extract_crate_into_table, { silent = true, desc = "Extract Crate Into Table" })
vim.keymap.set("n", "<leader>rH", crates.open_homepage, { silent = true, desc = "Open Homepage" })
vim.keymap.set("n", "<leader>rR", crates.open_repository, { silent = true, desc = "Open Repository" })
vim.keymap.set("n", "<leader>rD", crates.open_documentation, { silent = true, desc = "Open Documentation" })
vim.keymap.set("n", "<leader>rC", crates.open_crates_io, { silent = true, desc = "Open Crates.io" })
vim.keymap.set("n", "<leader>rL", crates.open_lib_rs, { silent = true, desc = "Open Lib.rs" })

