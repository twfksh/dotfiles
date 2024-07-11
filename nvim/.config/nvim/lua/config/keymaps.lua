local nnoremap = require("config.utils").nnoremap
local inoremap = require("config.utils").inoremap

-- General keymaps
nnoremap('-', vim.cmd.Ex, { desc = 'Reveal netrw file/directory explorer' })
nnoremap('<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search hl on pressing <Esc> in normal mode' })
nnoremap(';', ':', { desc = 'Enter command mode' })
inoremap('jk', '<Esc>', { desc = 'Close insert mode' })

-- Diagnostic keymaps
nnoremap('[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
nnoremap(']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
nnoremap('<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
nnoremap('<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
