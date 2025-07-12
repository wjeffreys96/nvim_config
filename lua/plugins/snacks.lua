-- if true then return {} end

return {
  "folke/snacks.nvim",
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true, replace_ntrw = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = {
      enabled = true,
      hidden = true,
      ignored = true,
      files = {
        hidden = true,
        ignored = true,
      }
    },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = {
      enabled = true,
      animate = {
        duration = { step = 15, total = 250 },
        easing = "linear",
      },
    },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
