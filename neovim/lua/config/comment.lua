local status, plugin = pcall(require, 'Comment')
if (not status) then
    print('comment is not installed')
    return
end

local ts_context_commentstirng = require('ts_context_commentstring.integrations.comment_nvim')
plugin.setup({
    pre_hook = ts_context_commentstirng.create_pre_hook(),
})