---@diagnostic disable: unused-local
require("luasnip.session.snippet_collection").clear_snippets "javascript"

local ls = require "luasnip"
local s = ls.snippet
local d = ls.dynamic_node
local fNode = ls.function_node
local iNode = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("javascript", {
  s(
    "af",
    fmt("const {} = ({}) => {{ \n\t{} \n}};", {
      iNode(1, "funcName"),
      iNode(2, "params"),
      iNode(3, "body"),
    })
  ),
})
