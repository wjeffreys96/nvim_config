return {
    'saecki/crates.nvim',
    tag = 'stable',
    filetype = "rs",
    config = function()
        ---@diagnostic disable-next-line: missing-parameter
        require('crates').setup()
    end,
}
