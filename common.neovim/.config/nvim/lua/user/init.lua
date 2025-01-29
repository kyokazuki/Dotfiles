require("user.keymaps")
require("user.options")

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('nvim-treesitter/nvim-treesitter', { ['do'] = function()
    vim.fn[':TSUpdate']()
end })
Plug('numToStr/Comment.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-tree/nvim-tree.lua')
Plug('mbbill/undotree')
Plug('navarasu/onedark.nvim')

vim.call('plug#end')

require("user.plugins.treesitter")
require("user.plugins.comment")
require("user.plugins.nvim-tree")
require("user.plugins.undotree")
require("user.plugins.colorscheme")
