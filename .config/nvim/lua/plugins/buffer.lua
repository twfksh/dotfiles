local Plugins = {
  { -- autopairs
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },

  { -- gitsigns
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  { -- highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    event = 'BufEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  -- heuristically set buffer options
  { 'tpope/vim-sleuth' },

  { 'NvChad/nvim-colorizer.lua', event = 'BufEnter', opts = {} },
}

return Plugins
