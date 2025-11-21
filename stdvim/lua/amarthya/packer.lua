-- USE PackerSync to apply the changes
--
-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
-- This loads/ie; Installs packer.nvim plugin (which is a plugin manager) in nvim if it is 'opt'. But packer.nvim is in 'start'. We don't need the code below, as it automatically loads the plugin.
vim.cmd [[packadd packer.nvim]]

-- the return is optional. But, .startup - adds the plugins you need in the packer.nvim plugin manager
return require('packer').startup(function(use)
    -- Packer can manage itself
    -- packer.nvim is managed by packer.nvim plugin manager as a plugin itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = 'v0.1.9',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use { "sainnhe/gruvbox-material", 
    config = function()
        vim.g.gruvbox_material_enable_italic = true
        vim.g.gruvbox_material_background = 'medium'
        vim.cmd.colorscheme('gruvbox-material')
    end
}

use("nvim-treesitter/nvim-treesitter", {
    branch = 'master',
    run = ':TSUpdate'
})

use('nvim-treesitter/playground')
use('ThePrimeagen/harpoon')
use('mbbill/undotree')
use('tpope/vim-fugitive')
-- For LSP config (for every LSPs)
use('neovim/nvim-lspconfig')
-- For making the installation of LSP, DAP, Linter, Formatter -easy = Mason
use({
    'mason-org/mason.nvim',
    config = function()
        require("mason").setup()
    end
})
-- To enable all installed LSPs (Not DAPS or others)
use({
    'mason-org/mason-lspconfig.nvim',
    config = function()
        require("mason-lspconfig").setup()
    end
})
-- To ensure installing mason tools including & other than LSPs
use({
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    config = function()
        require('mason-tool-installer').setup {
            ensure_installed = {
                "lua_ls",
                "ts_ls",
                "bashls",
            },
        }
    end
})
-- For the nvim to communicate with the Installed DAPs or Installed Linters or Formatters (CLIs),
-- we need a mediator. For DAP, that is  'nvim-dap'. For Linters, that is 'nvim-lint', For Formatters, 
-- that is 'conform.nvim'.
-- OR for specific linters like 'eslint', ts_ls plugins are there to integrate the linter with language server 

  end)



