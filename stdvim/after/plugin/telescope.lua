-- 'after' folder configures the installed plugins
local builtin = require('telescope.builtin')
local actions = require("telescope.actions")

vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = 'Telescope grep string under cursor or selection'})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {desc = 'Telescope live grep string'})
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {desc = 'Help'})

require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
            }
        }
    }
})

