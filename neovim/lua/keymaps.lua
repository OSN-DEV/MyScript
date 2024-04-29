local keymap = vim.keymap

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- do not yank 
keymap.set('n', '""', '"_')
keymap.set('n', 'x', '"_x')

-- add line with normal
keymap.set('n', '<Leader>o', 'o<ESC>')
keymap.set('n', '<Leader>O', 'O<ESC>')

keymap.set('n', '<Leader>d', 'S<ESC>')
keymap.set('', '<Leader>d', 'S<ESC>')
keymap.set('n', '<ESC><ESC>', ':noh<CR>', { silent = true })

-- toggle setting
local toggleNum = function()
  vim.wo.relativenumber = not (vim.wo.relativenumber)
end
keymap.set('n', '<A-n>', toggleNum)

local toggleWrap = function()
  vim.wo.wrap = not (vim.wo.wrap)
end
keymap.set('n', '<A-z>', toggleWrap)
