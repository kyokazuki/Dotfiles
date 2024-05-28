return {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup({
            toggler = {
                line = '<leader>i',
                block = '<leader>o',
            },
            opleader = {
                line = '<leader>i',
                block = '<leader>o',
            },
        })
    end,
}
