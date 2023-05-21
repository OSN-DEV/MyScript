vim.cmd [[packadd packer.nvim]]

local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'                         -- ユーティリティ telescope-file-browserで使う。
  use 'nvim-telescope/telescope.nvim'                 -- フィアル検索など
  use "nvim-telescope/telescope-file-browser.nvim"    -- ファイル作成など

  use {
    'kyazdani42/nvim-tree.lua',                       --FileTree
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
  }
end)