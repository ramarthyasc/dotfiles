-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- add your plugins here
        {
            'nvim-telescope/telescope.nvim', tag = 'v0.1.9',
            dependencies = {'nvim-lua/plenary.nvim'}
        },

        { "sainnhe/gruvbox-material" },

        {
            "nvim-treesitter/nvim-treesitter",
            lazy = false,
            branch = 'master',
            build = ':TSUpdate'
        },

        {'nvim-treesitter/playground'},
        {'ThePrimeagen/harpoon'},
        {'mbbill/undotree'},
        {'tpope/vim-fugitive'},
        -- For LSP config (for every LSPs)
        {'neovim/nvim-lspconfig'},
        -- For making the installation of LSP, DAP, Linter, Formatter -easy = Mason
        { 
            'mason-org/mason.nvim',
            opts = {}
        },
        -- To enable all installed LSPs (Not DAPS or others)
        {
            'mason-org/mason-lspconfig.nvim',
            opts = {}
        },
        -- To ensure installing mason tools including & other than LSPs
        {
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            opts = {
                ensure_installed = {
                    "lua_ls",
                    "ts_ls",
                    "bashls",
                }
            }
        },
        -- For the nvim to communicate with the Installed DAPs or Installed Linters or Formatters (CLIs),
        -- we need a mediator. For DAP, that is  'nvim-dap'. For Linters, that is 'nvim-lint', For Formatters, 
        -- that is 'conform.nvim'.
        -- OR for specific linters like 'eslint', ts_ls plugins are there to integrate the linter with language server 

        {
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            config = true,
            opts = {
                map_c_h = true,
            }
        },

    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})




