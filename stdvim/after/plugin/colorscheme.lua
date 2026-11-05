vim.o.background = "light"

vim.g.gruvbox_material_enable_italic = true
vim.g.gruvbox_material_background = 'soft'

vim.cmd.colorscheme('gruvbox-material')

-- vim.cmd.colorscheme("newpaper")

-- require('nightfox').setup({
--   options = {
--     styles = {
--       comments = "italic",
--       keywords = "bold",
--       types = "italic,bold",
--     }
--   }
-- })
--
-- vim.cmd.colorscheme("dayfox")

vim.api.nvim_set_hl(0, "NvimTreeNormal", { link = "Normal" })
vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { link = "Normal" })
vim.api.nvim_set_hl(0, "NvimTreeNormalFloat", { link = "Normal" })
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#000000", bg = "NONE" })
vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { link = "NvimTreeNormal" })
