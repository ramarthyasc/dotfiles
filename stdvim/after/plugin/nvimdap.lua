local dap, dapui = require("dap"), require("dapui")

-- automatically configures the nvim-dap client to use respective language's debugger binary
require("mason-nvim-dap").setup({
	ensure_installed = {
		"delve",
		"js",
		"codelldb",
	},
	automatic_installation = true,
	handlers = {},
})

vim.keymap.set("n", "<Leader>bb", dap.toggle_breakpoint)
vim.keymap.set("n", "<Leader>br", dap.run_to_cursor)

vim.keymap.set("n", "<Leader>bc", dap.continue, {})
vim.keymap.set("n", "<Leader>bi", dap.step_into, {})
vim.keymap.set("n", "<Leader>bo", dap.step_over, {})
vim.keymap.set("n", "<Leader>bt", dap.step_out, {})
vim.keymap.set("n", "<Leader>bk", dap.step_back, {}) -- not needed
vim.keymap.set("n", "<Leader>br", dap.restart, {}) -- not needed

dapui.setup()
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

-- -- gdb adapter for C
-- dap.adapters.gdb = {
--     type = "executable",
--     command = "gdb",
--     args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
-- }
--
-- dap.configurations.c = {
--     {
--         name = "Launch",
--         type = "gdb",
--         request = "launch",
--         program = function()
--             return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--         end,
--         args = {}, -- provide arguments if needed
--         cwd = "${workspaceFolder}",
--         stopAtBeginningOfMainSubprogram = false,
--     },
-- }
