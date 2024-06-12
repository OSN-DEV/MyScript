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


-- -- 両方で使用するプラグイン
-- local commonPlugins = {
--     {
--        'gbprod/substitute.nvim',
--        event = { "BufReadPre", "BufNewFile"},
--        config = function()
--            require('config/substitute')
--        end
--     }
-- }

-- -- Neovimでのみ使用するプラグイン
-- local neovimPlugin = {
--     {
--         'kshenoy/vim-signature',
--         config = function()
--             require('config/signature')
--         end
--     },
--     {
--         'nvim-tree/nvim-web-devicons',
--         config = false
--     },
--     {
--         'romgrk/barbar.nvim',
--         config = function()
--             require('config/barbar')
--         end
--     },
--     {
--         'nvim-lualine/lualine.nvim',
--         dependencies = {'nvim-tree/nvim-web-devicons'},
--         config = function()
--             require('config/lualine')
--         end
--     },
--     {
--         'is0n/fm-nvim'
--     },
--     {
--         'lewis6991/gitsigns.nvim',
--         event = { "BufReadPre", "BufNewFile"},
--         config = function()
--             require('config/gitsigns')
--         end
--     },
--     {
--         "iamcco/markdown-preview.nvim",
--         cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
--         ft = { "markdown" },
--         build = function() vim.fn["mkdp#util#install"]() end,
--     },
--     {
--         'goolord/alpha-nvim',
--         requires = {
--             'nvim-tree/nvim-web-devicons',
--             'nvim-lua/plenary.nvim'
--         },
--         event = "VimEnter",
--         config = function()
--             require('config/alpha')
--         end
--     },
--     {
--         'rmagatti/auto-session',
--         config = function()
--             require('config/auto-session')
--         end
        
--     },
--     {
--         'stevearc/dressing.nvim',
--         event = "VeryLazy",
--     },
--     {
--         'lukas-reineke/indent-blankline.nvim',
--         event = { 'BufReadPre', 'BufNewFile' },
--         config = function(_, opts)
--             require('config/indent-blankline')
--         end
--     },
--     {
--         'windwp/nvim-autopairs',
--         event = { "InsertEnter" },
--         dependencies = {
--             'hrsh7th/nvim-cmp',
--         },
--         config = function()
--             require('config/nvim-autopairs')
--         end
--     },
--     {
--         'stevearc/conform.nvim',
--         event = { 'BufReadPre', 'BufNewFile'},
--         config = function()
--             require('config/formatting')
--         end
--     },
--     {
--         'mfussenegger/nvim-lint',
--         event = { 'BufReadPre', 'BufNewFile'},
--         config = function()
--             require('config/nvim-lint')
--         end
--     }
-- }

vscodePlugin = {}

commonPlugins = {
    -- カーソル移動
    {
        'phaazon/hop.nvim',
        -- config = true            -- config = trueを使う場合はfunctionの定義が必要
        config = function()
            require('config/hop')
        end
    },
    -- 文字列の囲いに関するユーティリティ
    {
        'tpope/vim-surround',
        event = { "BufReadPre", "BufNewFile" },
        version ="*",
        config = false,
    },
    -- ヤンクしたものをハイライト
    {
        'machakann/vim-highlightedyank',
        config = false
    },
    -- カーソル下の単語をハイライト
    {
        'osyo-manga/vim-brightest',
    },
}
neovimPlugin = {
    -- テーマ
    {
        'rebelot/kanagawa.nvim',
        lazy=false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme kanagawa]])
        end,
    },
    -- ファイル一覧表示
    { 
        'nvim-tree/nvim-tree.lua',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        config = function()
            require('config/nvim-tree')
        end
    },
    -- ファイル検索など
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 
            'nvim-lua/plenary.nvim',
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require('config/telescope')
        end
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { 
            "nvim-telescope/telescope.nvim",
            "nvim-tree/nvim-web-devicons",
            "nvim-lua/plenary.nvim"
        },
    },
    -- 構文解析
    {
        'nvim-treesitter/nvim-treesitter',
        event = { "BufReadPre", "BufNewFile"},
        build = ':TSUpdate',
        compilers = { "gcc" },
        config = function()
            require('config/tree-sitter')
        end
    },
    -- タグを自動で閉じる(tree-sitterが必要)
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require('config/nvim-ts-autotag')
        end
    },
    -- コメント設定
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
    -- 以降LSP関連
    {
        'neovim/nvim-lspconfig',
        config = function() 
        end
    },
    {
        'williamboman/mason.nvim',
        config = function() 
            require('config/mason')
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function() 
        end
    },
    {
        'hrsh7th/nvim-cmp',
        config = function() 
        end
    },
    {
        'hrsh7th/cmp-nvim-lsp',
        config = function() 
        end
    },
    {
        'hrsh7th/vim-vsnip',
        config = function() 
        end
    },
    {
        'hrsh7th/cmp-path',
        config = function() 
        end
    },
    {
        'hrsh7th/cmp-buffer',
        config = function() 
        end
    },
    {
        'hrsh7th/cmp-cmdline',
        config = function() 
        end
    },
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
