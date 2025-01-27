require("user.keymaps")
require("user.options")

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-tree/nvim-tree.lua')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = function()
    vim.fn[':TSUpdate']()
end })
Plug('numToStr/Comment.nvim')
Plug('navarasu/onedark.nvim')

vim.call('plug#end')

require("user.plugins.nvim-tree")
require("user.plugins.treesitter")
require("user.plugins.comment")
require("user.plugins.colorscheme")
