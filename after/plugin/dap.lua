local dap = require "dap"
local dapui = require("dapui")
require("dapui").setup()
local widgets = require "dap.ui.widgets"
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
vim.keymap.set("n", "<leader>dc", dap.continue)
vim.keymap.set("n", "<leader>dn", dap.step_over)
vim.keymap.set("n", "<leader>di", dap.step_into)
vim.keymap.set("n", "<leader>do", dap.step_out)
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dl", dap.list_breakpoints)
vim.keymap.set("n", "<leader>dr", dap.repl.open)
vim.keymap.set("n", "<leader>dk", function()
  dap.terminate()
  dap.clear_breakpoints()
  dapui.close()
end)
vim.keymap.set("n", "<Leader>dt", function()
  widgets.centered_float(widgets.threads)
end)
vim.keymap.set("n", "<Leader>ds", function()
  widgets.centered_float(widgets.scopes)
end)
vim.fn.sign_define("DapStopped", { text = "▶" })
vim.fn.sign_define("DapBreakpoint", { text = "•" })

vim.keymap.set({ "n", "v" }, "<leader>dh", widgets.hover)
require("nvim-dap-virtual-text").setup()
require("dap-go").setup()
