vim.cmd([[
  autocmd FileType clojure map <buffer><silent> <Bslash> :ConjureEvalCurrentForm<cr>
]])

vim.g["conjure#mapping#doc_word"] = false
vim.g["conjure#filetypes"] = {"clojure"}
-- vim.g["conjure#log#hud#enabled"] = false
vim.g["conjure#log#wrap"] = true
vim.g["conjure#highlight#enabled"] = true
vim.g["conjure#highlight#timeout"] = 150

