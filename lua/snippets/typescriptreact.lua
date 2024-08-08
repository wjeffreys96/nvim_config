---@diagnostic disable: unused-local
require("luasnip.session.snippet_collection").clear_snippets "typescriptreact"

local ls = require "luasnip"
local s = ls.snippet
local d = ls.dynamic_node
local f = ls.function_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.filetype_extend("typescriptreact", { "javascript" })

ls.add_snippets("typescriptreact", {
  s(
    "ust",
    fmt([[const [ {}, set{} ] = useState<{}>({})]], {
      i(1, "varName"),
      f(function(text)
        local capitalized_text = text[1][1]:gsub("^%l", string.upper)
        return capitalized_text
      end, { 1 }),
      i(2, ""),
      i(3, "init"),
    })
  ),
})
