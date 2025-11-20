local lsp_zero = require("lsp-zero")

-- lsp_attach is where you enable features that only work
-- if there is a language server active in the file
local lsp_attach = function(client, bufnr)
  local opts = { buffer = bufnr }

  vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
  vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
  vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
  -- vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
  vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
  vim.keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
  vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
  vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
  vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
  vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
end

lsp_zero.extend_lspconfig({
  sign_text = true,
  lsp_attach = lsp_attach,
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

require("mason").setup({})
require("mason-lspconfig").setup({
  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup({})
    end,
  }
})

---
-- Autocompletion config
---
local cmp = require("cmp")
local cmp_action = lsp_zero.cmp_action()
local cmp_format = require("lsp-zero").cmp_format({ details = true })

cmp.setup({
  preselect = cmp.PreselectMode.None,
  completion = {
    completeopt = "menu,menuone,noinsert"
  },
  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "buffer" },
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-l>"] = cmp.mapping.confirm({ select = true }),

    -- Ctrl+Space to trigger completion menu
    ["<C-Space>"] = cmp.mapping.complete(),

    ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),

    -- Navigate between snippet placeholder
    ["<C-f>"] = cmp_action.luasnip_jump_forward(),
    ["<C-b>"] = cmp_action.luasnip_jump_backward(),

    -- Scroll up and down in the completion documentation
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
  }),
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
  formatting = cmp_format,
})

vim.diagnostic.config({ virtual_text = true, signs = false })

vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>")

require("lspconfig").jdtls.setup({
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-21",
            path = "/home/st4r/.sdkman/candidates/java/current",
            default = true,
          }
        }
      }
    }
  }
})

require("lspconfig").lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
}
