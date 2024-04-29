-- https://github.com/hadronized/hop.nvim
local status, plugin = pcall(require, 'vim-signature')
if (not plugin) then
    print('vim-signature is not installed')
    return
end
