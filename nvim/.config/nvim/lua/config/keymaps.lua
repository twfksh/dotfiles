local nnoremap = require("config.utils").nnoremap
local inoremap = require("config.utils").inoremap
local vnoremap = require("config.utils").vnoremap

-- general keymaps
nnoremap('-', vim.cmd.Ex, { desc = 'Reveal netrw file/directory explorer' })
nnoremap('<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search hl on pressing <Esc> in normal mode' })
nnoremap(';', ':', { desc = 'Enter command mode' })
inoremap('jk', '<Esc>', { desc = 'Close insert mode' })

-- diagnostic keymaps
nnoremap('[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
nnoremap(']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
nnoremap('<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
nnoremap('<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- tmux stuff
nnoremap("<C-f>", ":silent !tmux neww ~/.local/bin/tmux-sessionizer<CR>")

-- open new tumx window in the current directory
nnoremap("<leader>tnw", function()
  local currentDir = vim.uv.cwd()
  vim.cmd("silent !tmux neww -c " .. currentDir)
end)

-- terminal stuff
nnoremap("<C-\\>", function()
  vim.cmd("belowright 12split")
  vim.cmd("set winfixheight")
  vim.cmd("term")
  vim.cmd("startinsert")
end)

-- move stuff up and down in visual mode
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

-- with wrap mode this will move the cursor to the next line
nnoremap("j", "gj")
nnoremap("k", "gk")
