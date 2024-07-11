return {
  'mbbill/undotree',
  event = "BufEnter",
  config = function()
    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
  end
}
