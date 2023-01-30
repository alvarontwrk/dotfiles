vim.g.mapleader = " "
-- Open dirtree
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- While in visual mode, move the selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- When J, puts the cursor at the start of the line
vim.keymap.set("n", "J", "mzJ`z")
-- Page up and down keeping the cursor at the middle of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Searches stays also in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- overwrite B with A, keeping A in the clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])

-- keep system and vim clipboard separated
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- ??
vim.keymap.set("n", "Q", "<nop>")
-- It doesn't work
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- Format the whole file
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- ??
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Takes the word you are placed in and start a replace by action
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- chmod +x to the file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
