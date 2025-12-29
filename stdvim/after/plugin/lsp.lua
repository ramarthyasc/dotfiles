-- Turn diagnostics on or off
vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true
})

vim.keymap.set("n", "<leader>e",function ()
    vim.diagnostic.open_float()
end, {silent = true, noremap = true}
)
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})

--Configure & enable language servers using Nvim's std lsp.enable and lsp.config features
--
--Overriding or extending the Default config provided by 'nvim-lspconfig' (No need to do this for other languages)
vim.lsp.config('lua_ls', {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file('', true),
			}
		}
	}
})


-- Enable the lsps  NOTE: (Don't need to enable anymore - as 'mason-tools' "ensure_installed" will do it
-- vim.lsp.enable('lua_ls')
-- vim.lsp.enable('ts_ls')

