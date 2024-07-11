local M = {
  'folke/which-key.nvim',
  event = 'VimEnter',
}

M.config = function()
  require('which-key').setup()
end

return M
