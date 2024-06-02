local status, plugin = pcall(require, "todo-comments")
if (not status) then
    print('todo-comments is not installed')
    return
end

local keymap = vim.keymap
keymap.set("n", "]t", function()
    plugin.jump_next()
end, { desc = "Next todo comment"})

keymap.set("n", "[t", function()
    plugin.jump_prev()
end, { desc = "Previous todo comment"})

plugin.setup()

-- TODO why...
