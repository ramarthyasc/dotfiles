local dap, dapui = require("dap"), require("dapui")

require ('mason-nvim-dap').setup({
    ensure_installed = {'codelldb'},
    handlers = {}, -- sets up dap in the predefined manner
})

vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint)
vim.keymap.set('n', '<Leader>gb', dap.run_to_cursor)

vim.keymap.set('n', '<Leader>1', dap.continue, {})
vim.keymap.set('n', '<Leader>2', dap.step_into, {})
vim.keymap.set('n', '<Leader>3', dap.step_over, {})
vim.keymap.set('n', '<Leader>4', dap.step_out, {})
vim.keymap.set('n', '<Leader>5', dap.step_back, {})
vim.keymap.set('n', '<Leader>6', dap.restart, {})


dapui.setup();
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
