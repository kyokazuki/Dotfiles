return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        -- recommended settings
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- keymaps
        vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
	vim.keymap.set("n", "<leader>q", ":bd<CR>:NvimTreeToggle<CR>:NvimTreeToggle<CR><C-w>l")

        -- fix inconsistency when entering
        -- vim.api.nvim_create_autocmd("VimEnter", {command = "NvimTreeFindFile"})
        vim.api.nvim_create_autocmd("VimEnter", {command = "NvimTreeClose"})
        vim.api.nvim_create_autocmd("ExitPre", {command = "NvimTreeClose"})

        require("nvim-tree").setup({
            hijack_cursor = true,
            renderer = {
                indent_width = 2,
                highlight_opened_files = "all",
                indent_markers = {
                    enable = true,
                    icons = { 
                        corner = "└",
                        edge = "│",
                        item = "├",
                        bottom = "─",
                        none = "",
                    }
                },
                icons = {
                    show = {
                        file = false,
                        folder = true,
                        git = false,
                    },
                    glyphs = {
                        folder = {
                            arrow_closed = "└",
                            arrow_open = "└",
                            default = "",
                            open = "",
                            empty = "",
                            empty_open = "",
                            symlink = "",
                            symlink_open = "",
                        },
                        symlink = "",
                    },
                },
            },
	    view = {
		side = "left",
		signcolumn = "no",
	    },
        })
    end
}
