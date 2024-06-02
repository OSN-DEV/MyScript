local status, plugin = pcall(require, 'nvim-ts-autotag')
if (not status) then
    print('treesitter is not installed')
    return
end

plugin.setup({
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = false
  },
})
