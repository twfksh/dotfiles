local Plugin = {
  'folke/which-key.nvim',
  event = 'VimEnter',
}

Plugin.config = function()
  require('which-key').setup()
end

return Plugin
