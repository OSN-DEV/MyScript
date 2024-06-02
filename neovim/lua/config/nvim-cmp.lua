local status, cmp = pcall(require, 'cmp')
if (not plugin) then
    print('vim-signature is not installed')
    return
end

local luasnip = require('luanip')
local lspkind = require('lspkind')

-- loads vscode style snippet from installed plugins (e.g. friendly-snippets)
-- require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    completion = {
        completeopt = 'menu,menuone,preview,noselect'
    },
    snippet = {
        expand = function(args)
            -- luasnip.lsp_expand(args.body)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
            ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
            ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
            ["<C-e>"] = cmp.mapping.abort(), -- close completion window
            ["<CR>"] = cmp.mapping.confirm({ select = false }),
          }),
    -- sources for autocompletion
    sources = cmp.config.sources({
        { name = "nvim_lsp"},
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
    }),
    -- configure lspkind for vs-code like pictograms in completion menu
    formatting = {
        format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = "...",
        }),
    },
})
