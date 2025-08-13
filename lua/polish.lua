-- disable mouse
vim.opt.mouse = ""

-- set pyenv venv
vim.g.python3_host_prog = "/home/will/.pyenv/versions/neovim3/bin/python"

-- Change the whole word regardless of if the cursor is at the beginning or not
vim.keymap.set("n", "cw", "ciw")

vim.opt.colorcolumn = "101"
