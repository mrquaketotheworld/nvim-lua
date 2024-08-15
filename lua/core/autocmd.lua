vim.cmd([[
  augroup start
    au!
    au TextYankPost * silent! lua vim.highlight.on_yank {higroup=(vim.fn["hlexists"]("HighlightedyankRegion") > 0 and "HighlightedyankRegion" or "IncSearch"), timeout=150}
    au WinEnter term://* startinsert
    au VimEnter,WinEnter,BufWinEnter * set cursorline signcolumn=auto
    au WinLeave * set nocursorline
    au TermOpen * setlocal nonumber norelativenumber
    au FileType go setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
    au BufRead,BufNewFile *.cljd setfiletype clojure
    au BufRead,BufNewFile *.arb setfiletype json
    au BufRead,BufNewFile *.gohtml setfiletype html
  augroup END
]])

-- local function open_nvim_tree()
--   require("nvim-tree.api").tree.open()
-- end

-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
require "colorizer".setup({ "css" }) -- creates autocmd

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "conjure*" },
  callback = function(ev)
    vim.diagnostic.disable(ev.buf)
  end
})
