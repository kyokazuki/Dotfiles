require("user.keymaps")
require("user.options")

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('nvim-treesitter/nvim-treesitter', { ['do'] = function()
    vim.fn[':TSUpdate']()
end })
Plug('numToStr/Comment.nvim')
Plug('lukas-reineke/indent-blankline.nvim')
Plug('karb94/neoscroll.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-tree/nvim-tree.lua')
Plug('nvim-lualine/lualine.nvim')
Plug('keaising/im-select.nvim')
Plug('navarasu/onedark.nvim')
Plug('loctvl842/monokai-pro.nvim')

vim.call('plug#end')

require("user.plugins.treesitter")
require("user.plugins.comment")
require("user.plugins.indentline")
require("user.plugins.neoscroll")
require("user.plugins.nvim-tree")
require("user.plugins.lualine")
require("user.plugins.im-select")
require("user.plugins.colorscheme")
