return { 
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        require("gruvbox").setup({
            palette_overrides = {
                dark0 = "#1d2021",
            }
        })
        vim.cmd("colorscheme gruvbox")
    end
}

