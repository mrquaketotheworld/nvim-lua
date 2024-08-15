-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = vim.api.nvim_replace_termcodes("<BS>", false, false, true)

-- Yank p to +
vim.keymap.set("n", "<leader>y", "\"+yip")

-- Write
vim.keymap.set("n", "<leader>w", ":w!<cr>")

-- Write and exit
vim.keymap.set("n", "<leader>x", ":x!<cr>", {silent = true})

-- Revert buffer
vim.keymap.set("n", "<leader>r", ":e!<cr>", {silent = true})

-- NETRW
vim.keymap.set("n", "<leader>e", ":set autochdir<cr>:Oil<cr>", {silent = true})

-- Quit all
vim.keymap.set("n", "<leader>!", ":qa!<cr>")

-- Move lines
vim.keymap.set("v", "J", ":m \'>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m \'<-2<cr>gv=gv")

-- CMD history navigation
vim.keymap.set("c", "<C-p>", "<Up>")
vim.keymap.set("c", "<C-n>", "<Down>")

-- Quickfix list navigation
vim.keymap.set("n", "[e", ":cp<cr>", {silent = true})
vim.keymap.set("n", "]e", ":cn<cr>", {silent = true})

-- Delete buffer & close window
vim.keymap.set("n", "<A-;>", ":bd!<cr>", {silent = true})

-- Only one window
vim.keymap.set("n", "<leader>o", "<C-w>o")

-- Close window
vim.keymap.set("n", "<leader>q", "<C-w>q")

-- Open terminal
vim.keymap.set("n", "<leader>v", ":vsplit term://bash<cr><C-\\><C-n>:norm A<cr>", {silent = true})
vim.keymap.set("n", "<leader>t", ":split term://bash<cr><C-\\><C-n>:norm A<cr>", {silent = true})
vim.keymap.set("n", "<A-t>", "<C-w>l\"C:vsplit term://bash<cr><C-\\><C-n>" ..
                             ":split term://bash<cr><C-\\><C-n>" ..
                             ":split term://bash<cr><C-\\><C-n><C-w>h" ..
                             "35<C-w>>:ConjureLogSplit<cr>15<C-w>-" ..
                             "<C-w>k<C-w>l lein repl :start :port 1667<cr>" ..
                             "<C-\\><C-n><C-w>h",
                             {silent = true})

-- Close terminal
vim.keymap.set("t", "<A-;>", "<C-\\><C-n>:bd!<cr>", {silent = true})

-- Window jumping
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")
vim.keymap.set("i", "<A-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("i", "<A-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("i", "<A-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("i", "<A-l>", "<C-\\><C-n><C-w>l")
vim.keymap.set("t", "<A-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<A-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<A-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<A-l>", "<C-\\><C-n><C-w>l")
