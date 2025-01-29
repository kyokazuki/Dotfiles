return {
    "nvim-treesitter/nvim-treesitter",
    --event = {"BufReadPre", "BugNewFile"},
    build = ":TSUpdate",
    -- dependencies = {"windwp/nvim-ts-autotag",},
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bash",
                "comment",
                "cpp",
                "html",
                "lua",
                "python",
                "vim", 
            },
            --sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },  
        })
    end
}
