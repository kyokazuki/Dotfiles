local opts = { noremap = true, silent = true }

-- Leader Key --
vim.g.mapleader = " "

-- Motion --
vim.keymap.set({"n", "v"}, "h", "h", opts)
vim.keymap.set({"n", "v"}, "j", "gj", opts)
vim.keymap.set({"n", "v"}, "k", "gk", opts)
vim.keymap.set({"n", "v"}, "l", "l", opts)

-- Navigate windows
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Resize windows
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Move text up and down
vim.keymap.set("n", "<A-l>", "ddkP", opts)
vim.keymap.set("n", "<A-k>", "ddp", opts)

-- Tabbing
vim.keymap.set("n", "<Tab>", "V>", opts)
vim.keymap.set("n", "<S-Tab>", "V<", opts)
vim.keymap.set("v", "<Tab>", ">gv", opts)
vim.keymap.set("v", "<S-Tab>", "<gv", opts)

-- New line
vim.keymap.set("n", "<C-Enter>", "o<Esc>^D", opts)
vim.keymap.set("i", "<C-Enter>", "<Esc>o<Esc>^Di", opts)

-- Paste over
vim.keymap.set("v", "p", '"_dP', opts)

-- Navigate buffers
vim.keymap.set("n", "<A-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<A-h>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>q", ":bd<CR>", opts)

-- Show tab as characters
vim.keymap.set("n", "<leader>t", function()
	vim.cmd("set list!")
	vim.cmd("set listchars=tab:>·")
end)
