local status, telescope = pcall(require, "telescope")
if (not status) then
  print('telescope is not installed')
  return
end

local actions = require('telescope.actions')
local builtin = require("telescope.builtin")
function telescope_buffer_dir() 
  return vim.fn.expand('%:p:h')
end
local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ['q'] = actions.close,
        ['<c-d>'] = require('telescope.actions').delete_buffer
      },
      i= {
        ["<C-h>"] = "which_key",
        ['<c-d>'] = require('telescope.actions').delete_buffer
      }
    }
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
  },
}
telescope.load_extension("file_browser")

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<Leader>c', '<cmd>lua require("telescope.builtin").find_files({ no_ignore = false, hidden = true })<cr>', opts)
vim.keymap.set('n', '<Leader>r', '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
vim.keymap.set('n', '<Leader>b', '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
vim.keymap.set('n', '<Leader>t', '<cmd>lua require("telescope.builtin").help_tags()<cr>', opts)
vim.keymap.set('n', '<Leader>;', '<cmd>lua require("telescope.builtin").resume()<cr>', opts)
vim.keymap.set('n', '<Leader>e', '<cmd>lua require("telescope.builtin").diagnostics()<cr>', opts)
vim.keymap.set('n', '<Leader>f', '<cmd>lua require("telescope.builtin").find_files( { cwd = vim.fn.expand("%:p:h") })<cr>', opts)
vim.keymap.set("n", "<Leader>sf", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)


-- local action = require('telescope.actions')

-- local function telescope_buffer_dir()
--   return vim.fn.expand('%:p:h')
-- end

-- telescope.setup {
--   defaults = {
--     mappings = {
--       n = {
--         ["q"] = action.close
--       },
--     },
--   },
-- }

-- -- keymaps
-- vim.keymap.set('n', ';f',
--   function()
--     builtin.find_files({
--       no_ignore = false,
--       hidden = true
--     })
--   end)
-- vim.keymap.set('n', ';r', function()
--   builtin.live_grep()
-- end)
-- vim.keymap.set('n', '\\\\', function()
--   builtin.buffers()
-- end)
-- vim.keymap.set('n', ';t', function()
--   builtin.help_tags()
-- end)
-- vim.keymap.set('n', ';;', function()
--   builtin.resume()
-- end)
-- vim.keymap.set('n', ';e', function()
--   builtin.diagnostics()
-- end)
