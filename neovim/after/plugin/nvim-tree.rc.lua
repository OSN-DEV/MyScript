local status, nvim_tree = pcall(require, 'nvim-tree')
if (not status) then
  print('nvim-tree is not installed')
  return
end

nvim_tree.setup {
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    }
  }
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<Leader>n', '<cmd>NvimTreeFindFile<cr>', opts)
-- -vim.keymap.set('n', '<Leader>c', '<cmd>NvimTreeToggle<cr>', opts)
