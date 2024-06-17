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
    -- カッコやクォートを閉じる
    {
        'windwp/nvim-autopairs',
        dependencies = {
            'hrsh7th/nvim-cmp',
        },
        config = function()
            require('config/nvim-autopairs')
        end
    },
    -- 行の印をつける
    {
        'kshenoy/vim-signature',
        config = function()
            require('config/signature')
        end
    },
    -- バッファのタブ表示
    {
        'romgrk/barbar.nvim',
        config = function()
            require('config/barbar')
        end
    },
    -- ステータスラインのカスタマイズ
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        config = function()
            require('config/lualine')
        end
    },
    -- Gitの変更状態を表示
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('config/gitsigns')
        end
    },
    -- Git Diff/Mergeツール
    {
        'sindrets/diffview.nvim',
        config = function()
        end
    },
    -- -- マークダウンのプレビュー表示(機能せず)
    -- {
    --     "iamcco/markdown-preview.nvim",
    --     ft = { "markdown" },
    --     build = function() vim.fn["mkdp#util#install"]() end,
    -- },
    -- -- install with yarn or npm
    -- {
    --   "iamcco/markdown-preview.nvim",
    --   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    --   build = "cd app && yarn install",
    --   init = function()
    --     vim.g.mkdp_filetypes = { "markdown" }
    --   end,
    --   ft = { "markdown" },
    -- },
    -- {
    --     'rmagatti/auto-session',
    --     config = function()
    --         require('config/auto-session')
    --     end
    -- },
    -- フィアル名の入力ダイアログを表示
    {
        'stevearc/dressing.nvim',
        event = "VeryLazy",
    },
    -- カッコに対応するの強調表示
    {
        'lukas-reineke/indent-blankline.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function(_, opts)
            require('config/indent-blankline')
        end
    },
--     {
--         'stevearc/conform.nvim',
--         event = { 'BufReadPre', 'BufNewFile'},
--         config = function()
--             require('config/formatting')
--         end
--     },
    -- Lint
    {
        'mfussenegger/nvim-lint',
        event = { 'BufReadPre', 'BufNewFile'},
        config = function()
            require('config/nvim-lint')
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
    {
        'nvim-tree/nvim-web-devicons',
        config = false
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
