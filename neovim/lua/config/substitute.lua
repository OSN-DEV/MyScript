local status, plugin = pcall(require, "substitute")
if (not status) then
    print('substitute is not installed')
    return
end

plugin.setup()

local keymap = vim.keymap

keymap.set("n", "<leader>s", plugin.operator, { desc = "Substitute with motion"})
keymap.set("n", "<leader>ss", plugin.line, { desc = "Substitute line"})
keymap.set("n", "<leader>S", plugin.line, { desc = "Substitute to end of line"})
keymap.set("x", "<leader>s", plugin.visual, { desc = "Substitute with motion"})
