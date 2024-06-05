if vim.loop.os_uname().sysname == "Windows_NT" then
  return {
    "AstroNvim/astrolsp",
    ---@param opts AstroLSPOpts
    ---@diagnostic disable: missing-fields
    opts = function(_, opts)
      if vim.bo.filetype == "c" then
        opts.config.clangd = {
          cmd = { "clangd", "--query-driver=C:\\msys64\\clang64\\bin\\clang.exe" },
        }
      elseif vim.bo.filetype == "cpp" then
        opts.config.clangd = {
          cmd = { "clangd", "--query-driver=C:\\msys64\\clang64\\bin\\clang++.exe" },
        }
      end
    end,
  }
end
