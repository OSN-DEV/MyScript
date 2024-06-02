-- https://github.com/nvim-tree/nvim-tree.lua
local status, plugin = pcall(require, 'nvim-tree')
if (not plugin) then
    print('nvim tree is not installed')
    return
end

plugin.setup {
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    relativenumber = true,
  },
  renderer = {
    group_empty = true,
    indent_markers = {
      enable = true,
    },
  },
  filters = {
    dotfiles = true,
  },
  git = {
    ignore = false,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    }
  }
}

-- local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', '<Leader>n', '<cmd>NvimTreeFindFile<cr>', opts)
-- vim.keymap.set('n', '<Leader>c', '<cmd>NvimTreeToggle<cr>', opts)

vim.keymap.set('n', '<Leader>n', '<cmd>NvimTreeFindFile<cr>', { desc = "Toggle file explorer on current file"})
vim.keymap.set('n', '<Leader>c', '<cmd>NvimTreeToggle<cr>',  {desc = "Toggle file explorer "})
vim.keymap.set('n', '<Leader>ec', '<cmd>NvimTreeCollapse<cr>',  {desc = "Collapse file explorer"})
vim.keymap.set('n', '<Leader>er', '<cmd>NvimTreeRefresh<cr>',  {desc = "Refresh file explorer"})

