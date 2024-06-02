local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

function mergeTables(t1, t2)
    local merged = {}
    for _, v in ipairs(t1) do
        table.insert(merged, v)
    end
    for _, v in ipairs(t2) do
        table.insert(merged, v)
    end
    return merged
end

local isVsCode = vim.g.vscode == 1


-- 両方で使用するプラグイン
local commonPlugins = {
    {
        'phaazon/hop.nvim',
        -- config = true            -- config = trueを使う場合はfunctionの定義が必要
        config = function()
            require('config/hop')
        end
    },
    {
        'numToStr/Comment.nvim',
        event = { "BufReadPre", "BufNewFile"},
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
        config = function()
            require('config/comment')
        end
        
    },
    {
        -- うまいこと機能していない
        'folke/todo-comments.nvim',
        event = { "BufReadPre", "BufNewFile"},
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        config = function()
            require('config/todo-comments')
        end
    },
    {
        'tpope/vim-surround',
        event = { "BufReadPre", "BufNewFile" },
        version ="*",
        config = false,
    },
    {
        'machakann/vim-highlightedyank',
        config = false
    },
    {
        'osyo-manga/vim-brightest',
    },
    {
       'gbprod/substitute.nvim',
       event = { "BufReadPre", "BufNewFile"},
       config = function()
           require('config/substitute')
       end
    }
}

-- Neovimでのみ使用するプラグイン
local neovimPlugin = {
    {
        'rebelot/kanagawa.nvim',
        lazy=false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme kanagawa]])
        end,
    },
    {
        'kshenoy/vim-signature',
        config = function()
            require('config/signature')
        end
    },
    {
        'nvim-tree/nvim-web-devicons',
        config = false
    },
    { 
        'nvim-tree/nvim-tree.lua',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        config = function()
            require('config/nvim-tree')
        end
    },
    {
        'romgrk/barbar.nvim',
        config = function()
            require('config/barbar')
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        config = function()
            require('config/lualine')
        end
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim', "nvim-tree/nvim-web-devicons", 'folke/todo-comments.nvim' },
        config = function()
            require('config/telescope')
        end
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
    },
    {
        'is0n/fm-nvim'
    },
    {
        'lewis6991/gitsigns.nvim',
        event = { "BufReadPre", "BufNewFile"},
        config = function()
            require('config/gitsigns')
        end
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require('config/nvim-ts-autotag')
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        event = { "BufReadPre", "BufNewFile"},
        build = ':TSUpdate',
        compilers = { "gcc" },
        config = function()
            require('config/tree-sitter')
        end
    },
    {
        'goolord/alpha-nvim',
        requires = {
            'nvim-tree/nvim-web-devicons',
            'nvim-lua/plenary.nvim'
        },
        event = "VimEnter",
        config = function()
            require('config/alpha')
        end
    },
    {
        'rmagatti/auto-session',
        config = function()
            require('config/auto-session')
        end
        
    },
    {
        'stevearc/dressing.nvim',
        event = "VeryLazy",
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function(_, opts)
            require('config/indent-blankline')
        end
    },
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            "hrsh7th/cmp-buffer",                   -- source for text in buffer
            "hrsh7th/cmp-path",                     -- source for file sytem paths
            {
                'L3MON4D3/LuaSnip',
                version = 'v2.*',
                build = 'make install_jsregexp',
            },
            "saadparwaiz1/cmp_luasnip",             -- for autocompletion
            "rafamadriz/friendly-snippets",         -- useful snippets
            "onsails/lspkind.nvim",                 -- vs-code like pictograms
        },
        config = function()
            require('config/nvim-cmp')
        end
    },
    {
        'windwp/nvim-autopairs',
        event = { "InsertEnter" },
        dependencies = {
            'hrsh7th/nvim-cmp',
        },
        config = function()
            require('config/nvim-autopairs')
        end
    },
    {
        'williamboman/mason.nvim',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',
        },
        config = function()
            require('config/lsp/mason')
        end
    },
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', 'BufNewFile'},
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            {'antosha417/nvim-lsp-file-operations', config = true},
            { 'folke/neodev.nvim', opts = {}},
        },
        config = function() 
            require('config/lsp/lspconfig')
        end
    },
    {
        'folke/trouble.nvim',
        dependencies = {"nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim"},
        config = function()
            require('config/trouble')
        end
    },
    {
        'stevearc/conform.nvim',
        event = { 'BufReadPre', 'BufNewFile'},
        config = function()
            require('config/formatting')
        end
    },
    {
        'mfussenegger/nvim-lint',
        event = { 'BufReadPre', 'BufNewFile'},
        config = function()
            require('config/nvim-lint')
        end
    }
}

require('lazy').setup(
    mergeTables(
        commonPlugins,
        isVsCode and vscodePlugin or neovimPlugin
    ),
    {
        checker = {
            enable = true,
            notify = false,
        },
        change_detection ={notify=false},
    }
)
