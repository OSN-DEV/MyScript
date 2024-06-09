local status, plugin = pcall(require, 'nvim-treesitter')
if (not status) then
    print('treesitter is not installed')
    return
end

local configs = require("nvim-treesitter.configs")
configs.setup({
    highlight = { enabled = true },    -- syntax highlighintg
    -- indent = { enable = true },
    -- autotag = { enable = true },
    ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "vimdoc",
        "c",
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>"
        }
    }
})