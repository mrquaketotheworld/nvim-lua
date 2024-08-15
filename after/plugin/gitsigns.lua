require("gitsigns").setup({
  signs = {
    add          = { text = "┃" },
    change       = { text = "∼" },
    delete       = { text = "┃" },
    topdelete    = { text = "‾" },
    changedelete = { text = "≃" },
    untracked    = { text = "┆" },
  },
  on_attach = function()
    vim.keymap.set("n", "<leader>hp", ":Gitsigns preview_hunk<cr>", { silent = true })
    vim.keymap.set("n", "<leader>hu", ":Gitsigns reset_hunk<cr>", { silent = true })
    vim.keymap.set("n", "[c", ":Gitsigns prev_hunk<cr>", { silent = true })
    vim.keymap.set("n", "]c", ":Gitsigns next_hunk<cr>", { silent = true })
  end
})
