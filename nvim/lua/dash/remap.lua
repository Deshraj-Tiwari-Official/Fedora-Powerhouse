vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- I mean why not
map("n", ";", ":")

-- Copy to system clipboard
map({"n", "v"}, "<leader>y", [["+y]])

-- Paste from system clipboard
map({"n", "v"}, "<leader>p", [["+p]])

-- Paste without overwriting current register
map("x", "<A-p>", [["_dP]])

-- Move lines up and down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Join below line with current line
map("n", "J", "mzJ`z")

-- Go half page up and down keep cursor in center of the page
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

-- Go to the next and previous occurence of the word searched last time
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Change all occurences of the word under the cursor in the current file
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Go to the next and previous errors keeping cursor in the center.
map("n", "<A-k>", "<cmd>cnext<CR>zz")
map("n", "<A-j>", "<cmd>cprev<CR>zz")

-- Window Management
map("n", "<C-Up>", "<cmd>resize -2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize +2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize +2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize -2<cr>", { desc = "Increase Window Width" })

-- Buffer Management
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")
