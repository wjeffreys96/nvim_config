---@diagnostic disable: unused-local
require("luasnip.session.snippet_collection").clear_snippets "typescriptreact"

local ls = require "luasnip"
local s = ls.snippet
local d = ls.dynamic_node
local fNode = ls.function_node
local iNode = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.filetype_extend("typescriptreact", { "javascript" })
