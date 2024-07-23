local M = {}

local function replace_prompt(search_term)
  -- Prompt for input
  vim.ui.input({ prompt = "Replace " .. search_term .. " with::" }, function(input)
    if input then
      -- Perform the replacement
      vim.cmd(string.format("%%s/%s/%s/g", search_term:gsub("/", "\\/"), input:gsub("/", "\\/")))
    end
  end)
end

function M.search_and_replace()
  vim.ui.input({ prompt = "Search for::" }, function(input)
    if input then replace_prompt(input) end
  end)
end

function M.replace_word_under_cursor()
  local word = vim.fn.expand "<cword>"
  replace_prompt(word)
end

function M.replace_visual_selection()
  local save_reg = vim.fn.getreg "z"
  vim.cmd [[normal! "zy]]
  local selected_text = vim.fn.getreg "z"
  vim.fn.setreg("z", save_reg)
  replace_prompt(selected_text)
end

return M
