local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup({
  { "nvim-telescope/telescope.nvim",   tag = "0.1.8" },
  "nvim-lua/plenary.nvim",
  { "nvim-treesitter/nvim-treesitter", cmd = "TSUpdate" },
  "mbbill/undotree",
  "tpope/vim-fugitive",
  "lewis6991/gitsigns.nvim",
  { "VonHeikemen/lsp-zero.nvim", branch = 'v4.x' },
  "neovim/nvim-lspconfig",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "nvim-lualine/lualine.nvim",
  { "phaazon/hop.nvim",     branch = "v2" },
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "mattn/emmet-vim",
  "Olical/conjure",
  "navarasu/onedark.nvim",
  "nvim-tree/nvim-web-devicons",
  -- "nvim-tree/nvim-tree.lua",
  "norcalli/nvim-colorizer.lua",
  "nelstrom/vim-visual-star-search",
  "equalsraf/neovim-gui-shim",
  "andymass/vim-matchup",
  "mfussenegger/nvim-dap",
  "leoluz/nvim-dap-go",
  "theHamsta/nvim-dap-virtual-text",
  {
    "numToStr/Comment.nvim",
    opts = {},
    lazy = false,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = false
    }
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    enable_moveright = false,
  },
  {
    "stevearc/oil.nvim",
    opts = {},
  },
  {
    "julienvincent/nvim-paredit",
    config = function()
      require("nvim-paredit").setup()
    end
  },
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
      hint_prefix = {
        above = "↙ ",
        current = "← ",
        below = "↖ "
      },
    },
    config = function(_, opts) require "lsp_signature".setup(opts) end
  },
  "nvim-java/nvim-java"
})
