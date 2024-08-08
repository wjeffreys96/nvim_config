require("luasnip.session.snippet_collection").clear_snippets "all"

local ls = require "luasnip"
local s = ls.snippet
local iNode = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("all", {
  s(
    "ternary",
    fmt("{} ? {} : {}", {
      iNode(1, "cond"),
      iNode(2, "then"),
      iNode(3, "else"),
    })
  ),
})
