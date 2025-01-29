return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        vim.api.nvim_create_autocmd(
            "VimEnter", 
            {
                -- set <C-u> to overwrite neoscroll
                callback = function()
                    vim.keymap.set("n", "<A-;>", ":BufferLineCycleNext<CR>")
                    vim.keymap.set("n", "<A-j>", ":BufferLineCyclePrev<CR>")
                end
            }
        )
        local bufferline = require("bufferline")
        bufferline.setup({
            options = {
                always_show_bufferline = true,
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
