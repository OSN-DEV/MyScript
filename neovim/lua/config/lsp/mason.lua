local status, mason = pcall(require, 'mason')
if (not status) then
    print('mason is not installed')
    return
end

local mason_tool_installer = require('mason-tool-installer')
mason.setup({
    ui = {
        icons = {
            package_installed = "✅",
            package_pending = "📌",
            package_uninstalled = "🗑️",
        },
    },
})

local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup({
    ensure_installed = {
        "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "prismals",
        "pyright",
        "eslint",
        "jsonls",
        "remark_ls",
    }
})

mason_tool_installer.setup({
         ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint",
        "eslint_d",
      }, 
})