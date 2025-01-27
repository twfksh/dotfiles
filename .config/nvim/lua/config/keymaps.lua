local nnoremap = require('config.utils').nnoremap
local inoremap = require('config.utils').inoremap
local vnoremap = require('config.utils').vnoremap

-- general keymaps
nnoremap('-', vim.cmd.Ex, { desc = 'Reveal netrw file/directory explorer' })
nnoremap('<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search hl on pressing <Esc> in normal mode' })
nnoremap(';', ':', { desc = 'Enter command mode' })
inoremap('jk', '<Esc>', { desc = 'Close insert mode' })

-- some fun register stuff
--vnoremap("<leader>y", '"+y')
--vnoremap("<leader>Y", '"+y$')
--vnoremap("<leader>d", '"_d')
--vnoremap("<leader>x", '"_x')
--vnoremap("<leader>p", '"_dP')

-- tmux stuff
nnoremap('<C-f>', ':silent !tmux neww ~/.local/bin/tmux-sessionizer<CR>')

-- open new tumx window in the current directory
nnoremap('<leader>tnw', function()
  local currentDir = vim.uv.cwd()
  vim.cmd('silent !tmux neww -c ' .. currentDir)
end)

-- terminal stuff
nnoremap('<C-\\>', function()
  vim.cmd 'belowright 12split'
  vim.cmd 'set winfixheight'
  vim.cmd 'term'
  vim.cmd 'startinsert'
end)

-- move stuff up and down in visual mode
vnoremap('J', ":m '>+1<CR>gv=gv")
vnoremap('K', ":m '<-2<CR>gv=gv")

-- with wrap mode this will move the cursor to the next line
nnoremap('j', 'gj')
nnoremap('k', 'gk')
