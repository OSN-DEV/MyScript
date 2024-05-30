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
        'tpope/vim-commentary',
        config = false
    },
    {
        'tpope/vim-surround',
        config = false
    },
    {
        'machakann/vim-highlightedyank',
        config = false
    },
    {
        'osyo-manga/vim-brightest',
    },
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
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('config/telescope')
        end
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    },
    {
        'is0n/fm-nvim'        
    },
    {
        'lewis6991/gitsigns.nvim'        
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
        end
    },


-- coc.nvim
-- Markdown Preview for (Neo)vim
}

require('lazy').setup(
    mergeTables(
        commonPlugins,
        isVsCode and vscodePlugin or neovimPlugin
    )
)
