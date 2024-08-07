-- :help keycodes

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-- Leader Key --
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Motion --
keymap("n", "j", "h", opts)
keymap("n", "k", "j", opts)
keymap("n", "l", "k", opts)
keymap("n", ";", "l", opts)
keymap("v", "j", "h", opts)
keymap("v", "k", "j", opts)
keymap("v", "l", "k", opts)
keymap("v", ";", "l", opts)

-- Normal --
-- Window navigation
keymap("n", "<C-j>", "<C-w>h", opts)
keymap("n", "<C-k>", "<C-w>j", opts)
keymap("n", "<C-l>", "<C-w>k", opts)
keymap("n", "<C-;>", "<C-w>l", opts)

-- keymap("n", "<leader>e", ":Lexplore 30<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
--keymap("n", "<C-p>", ":bnext<CR>", opts)
--keymap("n", "<C-u>", ":bprevious<CR>", opts)

-- Page down and up
-- keymap("n", "<C-i>", "<C-d>", opts)
-- keymap("n", "<C-o>", "<C-u>", opts)

-- Move text up and down
keymap("n", "<A-l>", "ddkP", opts)
keymap("n", "<A-k>", "ddp", opts)

-- Tab one line
keymap("n", "<Tab>", "V>", opts)
keymap("n", "<S-Tab>", "V<", opts)

-- Insert new line
keymap("n", "<C-Enter>", "o<Esc>^D", opts)

-- Insert --
-- New line
keymap("i", "<C-Enter>", "<Esc>o<Esc>^Di", opts)

-- Visual --
-- Indent
keymap("v", "<Tab>", ">gv", opts)
keymap("v", "<S-Tab>", "<gv", opts)

-- Paste over
keymap("v", "p", '"_dP', opts)

-- Terminal --
-- Terminal navigation
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-;>", "<C-\\><C-N><C-w>l", term_opts)

