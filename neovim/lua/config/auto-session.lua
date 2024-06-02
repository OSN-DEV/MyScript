local status, plugin = pcall(require, 'auto-session')
if (not status) then
    print('alpha-nvim is not installed')
    return
end


plugin.setup{
   auto_restore_enabled = false,
   auto_session_suppress_dirs = { "~/","~/Dev/", "~/Downloads", "~/Documents", "~/Descktop/"} 
}

local keymap = vim.keymap
keymap.set('n', "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd"})
keymap.set('n', "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir"})