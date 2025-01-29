return { 
    -- "ellisonleao/gruvbox.nvim",
    -- config = function()
    --     require("gruvbox").setup({
    --         palette_overrides = {
    --             dark0 = "#1d2021",
    --         }
    --     })
    --     vim.cmd("colorscheme gruvbox")
    -- end

 --    "rebelot/kanagawa.nvim",
 --    config = function()
 --        require("kanagawa").setup({
	-- })
 --        vim.cmd("colorscheme kanagawa")
 --    end

    "navarasu/onedark.nvim",
    config = function()
	require("onedark").setup({
	    style = 'dark'
	})
	vim.cmd("colorscheme onedark")
    end
}

