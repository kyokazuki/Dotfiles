return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        vim.keymap.set("n", "<C-p>", ":BufferLineCycleNext<CR>")
        vim.keymap.set("n", "<C-u>", ":BufferLineCyclePrev<CR>")
        local bufferline = require("bufferline")
        bufferline.setup({
            options = {
                always_show_bufferline = false,
                mode = "buffers",
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = function()
                            return vim.fn.getcwd()
                        end,
                        highlight = "Directory",
                        separator = true,
                    }
                },
                separator_style = "thin",
                style_preset = {
                    bufferline.style_preset.no_italic,
                    bufferline.style_preset.minimal,
                },
                sort_by = 'relative_directory',
            },
        })
    end
}
