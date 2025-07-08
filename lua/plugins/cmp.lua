return {
  "Saghen/blink.cmp",
  optional = true,
  opts = function(_, opts)
    if not opts.keymap then opts.keymap = {} end
    opts.keymap["<Tab>"] = { "snippet_forward", "fallback" }
    opts.keymap["<S-Tab>"] = { "snippet_backward", "fallback" }
    opts.keymap["<C-l>"] = { "select_and_accept", "fallback" }
  end,
}
