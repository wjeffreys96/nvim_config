-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "astrodark",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = {
        -- this table overrides highlights in all themes
        -- DiagnosticUnnecessary = { fg = "#567494" },
      },
      astrodark = { -- a table of overrides/changes when applying the astrotheme theme
        MatchParen = { fg = "#f5f5f5", bg = "#424242" },
        Constant = { fg = "#ff7043" },
        Identifier = { fg = "#eeeeee" },
        Structure = { fg = "#dd97f1" },
        ["@type.builtin"] = { italic = true, fg = "#ffb74d" },
      },
    },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
  },
}
