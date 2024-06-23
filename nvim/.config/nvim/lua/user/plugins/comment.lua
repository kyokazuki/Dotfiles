return {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup({
            toggler = {
                line = '<leader>c',
                -- block = '<leader>o',
            },
            opleader = {
                line = '<leader>c',
                -- block = '<leader>o',
            },
        })
    end,
}
