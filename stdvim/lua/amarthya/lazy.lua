-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
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
vim.opt.termguicolors = true

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
    {
      "nvim-telescope/telescope.nvim",
      tag = "v0.1.9",
      dependencies = { "nvim-lua/plenary.nvim" },
      keys = {
        { "<leader>pf", "<cmd>Telescope find_files<cr>",  desc = "Telescope find files" },
        { "<leader>pg", "<cmd>Telescope git_files<cr>",   desc = "Telescope git files" },
        { "<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "Telescope grep string" },
        { "<leader>ps", "<cmd>Telescope live_grep<cr>",   desc = "Telescope live grep" },
        { "<leader>ph", "<cmd>Telescope help_tags<cr>",   desc = "Telescope help" },
      },
      config = function()
        local actions = require("telescope.actions")
        require("telescope").setup({
          defaults = { mappings = { i = { ["<esc>"] = actions.close } } },
        })
      end,
    },

    { "sainnhe/gruvbox-material" },
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
    },
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    {
      "nvim-treesitter/nvim-treesitter",
      lazy = false,
      branch = "master",
      build = ":TSUpdate",
    },

    { "nvim-treesitter/playground" },
    {
      "ThePrimeagen/harpoon",
      keys = {
        { "<leader>a", function() require("harpoon.mark").add_file() end,        desc = "Harpoon add file" },
        { "<C-e>",     function() require("harpoon.ui").toggle_quick_menu() end, desc = "Harpoon menu" },
        { "<leader>h", function() require("harpoon.ui").nav_file(1) end,         desc = "Harpoon file 1" },
        { "<leader>j", function() require("harpoon.ui").nav_file(2) end,         desc = "Harpoon file 2" },
        { "<leader>k", function() require("harpoon.ui").nav_file(3) end,         desc = "Harpoon file 3" },
        { "<leader>l", function() require("harpoon.ui").nav_file(4) end,         desc = "Harpoon file 4" },
      },
      config = function()
        local ui = require("harpoon.ui")
        vim.api.nvim_create_autocmd("FileType", {
          pattern = "netrw",
          callback = function(args)
            vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end, { buffer = args.buf })
          end,
        })
      end,
    },
    { "mbbill/undotree" },
    { "tpope/vim-fugitive" },
    -- For LSP config (for every LSPs)
    { "neovim/nvim-lspconfig" },
    -- For making the installation of LSP, DAP, Linter, Formatter -easy = Mason
    {
      "mason-org/mason.nvim",
      opts = {},
    },
    -- To enable all installed LSPs (Not DAPS or others)
    {
      "mason-org/mason-lspconfig.nvim",
      opts = {},
    },
    -- To ensure installing mason tools including LSPs & other than LSPs when starting from scratch or opening nvim
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      opts = {
        ensure_installed = {
          -- LSP
          "lua_ls",
          "vtsls",
          "bashls",
          "tailwindcss",
          "yamlls",
          "emmet-language-server",
        },
      },
    },
    -- {
    --     "pmizio/typescript-tools.nvim",
    --     dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    --     opts = {},
    -- },
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
      },
    },
    {
      "saghen/blink.cmp",
      event = { "InsertEnter", "CmdlineEnter" },
      -- optional: provides snippets for the snippet source
      dependencies = {
        { "rafamadriz/friendly-snippets", lazy = true },
        {
          "L3MON4D3/LuaSnip",
          version = "v2.*",
          config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
          end,
        },
      },

      -- use a release tag to download pre-built binaries
      version = "1.*",
      -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
      -- build = 'cargo build --release',
      -- If you use nix, you can build from source using latest nightly rust with:
      -- build = 'nix run .#build-plugin',

      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      opts = {
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = { preset = "default" },

        appearance = {
          -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
          -- Adjusts spacing to ensure icons are aligned
          nerd_font_variant = "mono",
        },

        -- (Default) Only show the documentation popup when manually triggered
        completion = {
          documentation = { auto_show = false },
          menu = {
            draw = {
              columns = {
                { "kind_icon" },
                { "label",    "label_description", gap = 1 },
              },
            },
          },
          ghost_text = { enabled = true },
        },
        signature = { enabled = true },
        snippets = { preset = "luasnip" },
        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
          default = { "lsp", "path", "snippets", "buffer" },
        },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "prefer_rust_with_warning" },
      },
      opts_extend = { "sources.default" },
    },
    {
      "catgoose/nvim-colorizer.lua",
      event = "BufReadPre",
      opts = { user_default_options = { tailwind = true } },
    },
    {
      "nvim-treesitter/nvim-treesitter-context",
    },
    {
      {
        "folke/snacks.nvim",
        opts = function()
          -- Toggle the profiler
          Snacks.toggle.profiler():map("<leader>pp")
          -- Toggle the profiler highlights
          Snacks.toggle.profiler_highlights():map("<leader>po")
        end,
        keys = {
          {
            "<leader>pi",
            function()
              Snacks.profiler.scratch()
            end,
            desc = "Profiler Scratch Bufer",
          },
        },
      },
    },
    {
      "stevearc/oil.nvim",
      ---@module 'oil'
      ---@type oil.SetupOpts
      opts = {},
      -- Optional dependencies
      dependencies = { { "nvim-mini/mini.icons", opts = {} } },
      -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
      -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
      lazy = false,
    },
    {
      "mfussenegger/nvim-dap",
      keys = {
        { "<leader>b",  function() require("dap").toggle_breakpoint() end, desc = "Debug: toggle breakpoint" },
        { "<leader>gb", function() require("dap").run_to_cursor() end,     desc = "Debug: run to cursor" },
        { "<leader>1",  function() require("dap").continue() end,          desc = "Debug: continue" },
        { "<leader>2",  function() require("dap").step_into() end,         desc = "Debug: step into" },
        { "<leader>3",  function() require("dap").step_over() end,         desc = "Debug: step over" },
        { "<leader>4",  function() require("dap").step_out() end,          desc = "Debug: step out" },
        { "<leader>5",  function() require("dap").step_back() end,         desc = "Debug: step back" },
        { "<leader>6",  function() require("dap").restart() end,           desc = "Debug: restart" },
      },
      dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        { "jay-babu/mason-nvim-dap.nvim", opts = { ensure_installed = { "codelldb" }, handlers = {} } },
      },
      config = function()
        local dap, dapui = require("dap"), require("dapui")
        dapui.setup()
        dap.listeners.before.attach.dapui_config = function() dapui.open() end
        dap.listeners.before.launch.dapui_config = function() dapui.open() end
        dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
        dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
      end,
    },
    {
      "nickjvandyke/opencode.nvim",
      config = function()
        vim.g.opencode_opts = {}

        vim.keymap.set({ "n", "x" }, "<C-a>", function()
          require("opencode").ask("@this: ")
        end, { desc = "Ask OpenCode" })

        vim.keymap.set({ "n", "x" }, "<C-x>", function()
          require("opencode").select()
        end, { desc = "Select OpenCode" })

        vim.keymap.set({ "n", "x" }, "go", function()
          return require("opencode").operator("@this")
        end, { expr = true, desc = "Send selection to OpenCode" })

        vim.keymap.set("n", "goo", function()
          return require("opencode").operator("@this") .. "_"
        end, { expr = true, desc = "Send line to OpenCode" })
      end,
    },
    {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        vim.opt.termguicolors = true

        local height_ratio = 0.8
        local width_ratio = 0.5
        local api = require("nvim-tree.api")

        require("nvim-tree").setup({
          disable_netrw = true,
          hijack_netrw = true,
          respect_buf_cwd = true,
          sync_root_with_cwd = true,

          update_focused_file = {
            enable = true,
            update_root = false,
          },

          view = {
            relativenumber = true,
            float = {
              enable = true,
              open_win_config = function()
                local screen_w = vim.o.columns
                local screen_h = vim.o.lines - vim.o.cmdheight
                local width = math.floor(screen_w * width_ratio)
                local height = math.floor(screen_h * height_ratio)

                return {
                  relative = "editor",
                  border = "rounded",
                  row = math.floor((screen_h - height) / 2),
                  col = math.floor((screen_w - width) / 2),
                  width = width,
                  height = height,
                }
              end,
            },
            width = function()
              return math.floor(vim.o.columns * width_ratio)
            end,
          },
        })
        vim.keymap.set("n", "<leader>t", function()
          if api.tree.is_visible() then
            api.tree.close()
          else
            api.tree.open({ path = vim.fn.getcwd() })
            api.tree.find_file({ open = false, focus = false })
          end
        end, { desc = "Toggle project tree" })
      end,
    },

  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = false },
})
