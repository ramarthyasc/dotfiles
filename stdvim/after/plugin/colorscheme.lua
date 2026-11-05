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

vim.api.nvim_set_hl(0, "NvimTreeGitNew", { fg = "#a9b665", bold = true })
vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = "#e78a4e", bold = true })
vim.api.nvim_set_hl(0, "NvimTreeGitStaged", { fg = "#89b482", bold = true })
vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = "#ea6962", bold = true })
vim.api.nvim_set_hl(0, "NvimTreeGitRenamed", { fg = "#7daea3", bold = true })
vim.api.nvim_set_hl(0, "NvimTreeGitMerge", { fg = "#d3869b", bold = true })
vim.api.nvim_set_hl(0, "NvimTreeGitIgnored", { fg = "#928374" })

