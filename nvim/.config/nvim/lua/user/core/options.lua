-- :help options
vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.backup = false
vim.opt.breakindent = false
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 4
vim.opt.showmode = false
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.formatoptions = "tq"

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ 'r', 'o' })
  end,
})
