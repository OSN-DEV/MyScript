local status, alpha = pcall(require, 'alpha')
if (not status) then
    print('alpha-nvim is not installed')
    return
end

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
    [[                                    ██████                                    ]],
    [[                                ████▒▒▒▒▒▒████                                ]],
    [[                              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                              ]],
    [[                            ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                            ]],
    [[                          ██▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒                              ]],
    [[                          ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▓▓▓▓                          ]],
    [[                          ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▒▒▓▓                          ]],
    [[                        ██▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ██                        ]],
    [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
    [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
    [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
    [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
    [[                        ██▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒██                        ]],
    [[                        ████  ██▒▒██  ██▒▒▒▒██  ██▒▒██                        ]],
    [[                        ██      ██      ████      ████                        ]],
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "e", "📃  > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "🔎  > Find file", ":<cmd>Telescope find_files<CR>"),
    dashboard.button( "r", "⌛  > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "s", "🐜  > Tree" , "<cmd>NvimTreeToggle<CR>"),
    dashboard.button( "SPC wr", "🤖  > Resotre Session" , "<cmd>SessionRestore<CR>"),
    dashboard.button( "q", "💩  > Quit", ":qa<CR>"),
}

alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])