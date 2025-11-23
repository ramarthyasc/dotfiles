-- vim is an api variable provided by nvim itself (don't need to import it)
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>w", function()
    vim.opt.wrap = not vim.opt.wrap:get()
end
)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


--greatest remap ?
vim.keymap.set("x", "<leader>p", "\"_dp")

--next greatest remap ?
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+y$")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

--Vertical edit mode <C-c>
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
-- MAKE CUSTOM SCRIPT FOR ME - TMUX-NVIM-FZF linker
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

vim.keymap.set("n", "<leader>j", ":cnext<CR>zz")
vim.keymap.set("n", "<leader>k", ":cprev<CR>zz")
vim.keymap.set("n", "<leader>l", ":lnext<CR>zz")
vim.keymap.set("n", "<leader>h", ":lprev<CR>zz")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", {silent = true})




-- sdfs


















-- sd










-- sd
