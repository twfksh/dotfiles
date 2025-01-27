vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

-- Make netrtw look nicer
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- override netrw's directory delete command with the custom function
vim.g.netrw_localrmdir = function(directory)
  local rmdir = require('config.utils').delete_directory
  rmdir(directory)
  vim.cmd 'redraw! | e.'
end

-- plugin specification table
LAZY_PLUGIN_SPEC = {}

function Plug(item)
  table.insert(LAZY_PLUGIN_SPEC, { import = item })
end
