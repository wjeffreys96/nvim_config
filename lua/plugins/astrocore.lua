-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = false,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },
        -- Molten keybinds
        ["<Leader>mi"] = {
          function() vim.cmd ":MoltenInit" end,
          desc = "Initialize Molten",
        },
        ["<Leader>me"] = {
          function() vim.cmd "MoltenEvaluateOperator" end,
          desc = "Evaluate Operator",
        },
        ["<Leader>ml"] = {
          function() vim.cmd "MoltenEvaluateLine" end,
          desc = "Evaluate Line",
        },
        ["<Leader>mr"] = {
          function() vim.cmd "MoltenReevaluateCell" end,
          desc = "Re-evaluate Cell",
        },
        ["<Leader>md"] = {
          function() vim.cmd "MoltenDelete" end,
          desc = "Delete Cell",
        },
        ["<Leader>mh"] = {
          function() vim.cmd "MoltenHideOutput" end,
          desc = "Hide Output",
        },
        ["<Leader>mo"] = {
          function() vim.cmd ":noautocmd MoltenEnterOutput" end,
          desc = "Show/Enter Output",
        },
        ["<Leader>mn"] = {
          function() vim.cmd ":MoltenNext" end,
          desc = "Next Cell",
        },
        ["<Leader>mp"] = {
          function() vim.cmd ":MoltenPrev" end,
          desc = "Previous Cell",
        },
        ["<Leader>mx"] = {
          function() vim.cmd ":MoltenOpenInBrowser" end,
          desc = "Open Cell In Browser",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
      -- Visual Mode
      v = {
        ["<Leader>mv"] = {
          ":<C-u>MoltenEvaluateVisual<CR>gv",
          desc = "Evaluate Visual",
        },
      },
    },
  },
}
