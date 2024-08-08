return {
  "L3MON4D3/LuaSnip",
  config = function(plugin, opts)
    local ls = require "luasnip"

    local function loadSnippets()
      for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/snippets/*.lua", true)) do
        loadfile(ft_path)()
      end
    end

    -- set options
    opts.history = true
    opts.updateevents = "TextChanged,TextChangedI"
    opts.enable_autosnippets = true

    -- include the default astronvim config that calls the setup call
    require "astronvim.plugins.configs.luasnip"(plugin, opts)

    -- - keymaps ---
    -- expand or jump forward through a snippet
    vim.keymap.set({ "i", "s" }, "<C-k>", function()
      if ls.expand_or_jumpable() then ls.expand_or_jump() end
    end, { silent = true })

    -- jump backward through a snippet
    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      if ls.jumpable(-1) then ls.jump(-1) end
    end, { silent = true })

    -- select within a list of options in choice nodes
    vim.keymap.set({ "i", "s" }, "<c-l>", function()
      if ls.choice_active() then ls.change_choice(1) end
    end)

    -- source luasnips file to reload snippets
    vim.keymap.set("n", "<leader><leader>s", function() loadSnippets() end)

    loadSnippets()
  end, -- end config function
}
