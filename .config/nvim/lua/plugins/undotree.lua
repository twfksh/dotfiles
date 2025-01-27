local Plugin = { 'mbbill/undotree', event = 'BufEnter' }

Plugin.config = function(name, opts)
  vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Toggle undotree' })
end

return Plugin
