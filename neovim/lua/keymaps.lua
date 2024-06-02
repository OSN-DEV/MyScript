local keymap = vim.keymap

keymap.set('i', 'jk', "<ESC>", { desc = "Exit insert mode with jk" })

-- Increment/decrement
keymap.set('n', '+', '<C-a>', { desc = "Increment number"})
keymap.set('n', '-', '<C-x>', { desc = "Decrement number" })

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

-- window management
keymap.set("n", "<Leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<Leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<Leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<Leader>sx", "<cmd>close<CR>", { desc = "Close current split"})

-- とりあえず設定したけど、使わなさそうなのでどこかのタイミングで削除する。
keymap.set("n", "<Leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab"})
keymap.set("n", "<Leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab"})
keymap.set("n", "<Leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab"})
keymap.set("n", "<Leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab"})
keymap.set("n", "<Leader>tf", "<cmd>tab %<CR>", { desc = "Open current buffer in new tab"})

-- toggle setting
local toggleNum = function()
  vim.wo.relativenumber = not (vim.wo.relativenumber)
end
keymap.set('n', '<A-n>', toggleNum)

local toggleWrap = function()
  vim.wo.wrap = not (vim.wo.wrap)
end
keymap.set('n', '<A-z>', toggleWrap)

