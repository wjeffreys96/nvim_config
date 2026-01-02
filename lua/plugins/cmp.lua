return {
  "Saghen/blink.cmp",
  optional = true,
  opts = function(_, opts)
    if not opts.keymap then opts.keymap = {} end
    opts.keymap = {
      -- set to 'none' to disable the 'default' preset
      preset = "default",

      -- ["<Up>"] = { "select_prev", "fallback" },
      -- ["<Down>"] = { "select_next", "fallback" },

      -- disable a keymap from the preset
      -- ["<C-e>"] = false, -- or {}

      -- show with a list of providers
      -- ["<C-space>"] = { function(cmp) cmp.show { providers = { "snippets" } } end },

      -- control whether the next command will be run when using a function
      -- ["<C-n>"] = {
      --   function(cmp)
      --     if some_condition then return end -- runs the next command
      --     if some_other_condition then return "a" end -- simulate keypresses, doesn't run the next command
      --     return true -- doesn't run the next command
      --   end,
      --   "select_next",
      -- },
    }
  end,
}
