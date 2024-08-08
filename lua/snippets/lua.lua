---@diagnostic disable: param-type-mismatch
require("luasnip.session.snippet_collection").clear_snippets "lua"

local ls = require "luasnip"
local s = ls.snippet
local fNode = ls.function_node
local iNode = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
ls.add_snippets("lua", {
  s(
    "req",
    fmt([[local {} = require "{}"]], {
      fNode(function(import_name)
        local parts = vim.split(import_name[1][1], ".", true)
        return parts[#parts] or ""
      end, { 1 }),
      iNode(1),
    })
  ),
})
