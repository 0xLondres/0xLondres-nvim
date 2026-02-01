vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set relativenumber")
vim.opt.number = true
vim.g.mapleader = " "
vim.opt.fillchars:append({ eob = " " })
vim.o.wrap = true
vim.o.linebreak = true
vim.o.smartindent = true
vim.o.laststatus = 3
vim.opt.swapfile = false
vim.opt.cursorline = true

vim.keymap.set("n", "<c-k>", "<cmd>wincmd k<CR>")
vim.keymap.set("n", "<c-j>", "<cmd>wincmd j<CR>")
vim.keymap.set("n", "<c-h>", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<c-l>", "<cmd>wincmd l<CR>")

-- nvimtree
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- move round windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- tabufline
vim.keymap.set("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })
vim.keymap.set("n", "<tab>", function()
	require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })
vim.keymap.set("n", "<S-tab>", function()
	require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })
vim.keymap.set("n", "<leader>x", function()
	require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

vim.opt.pumheight = 8
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.pumblend = 5
