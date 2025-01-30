return {
  'tjdevries/colorbuddy.nvim',
  dependencies = {
    { 'echasnovski/mini.base16', version = '*' },
    { 'EdenEast/nightfox.nvim' },
    { 'sainnhe/everforest' },
    { 'rebelot/kanagawa.nvim' },
    { 'rose-pine/neovim',        name = 'rose-pine' },
    {
      "ricardoraposo/gruvbox-minor.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
    },
    { "atelierbram/Base2Tone-nvim" },
    { "antonio-hickey/citrus-mist" },
    {
      "chama-chomo/grail",
      version = false,
      lazy = false,
      priority = 1000, -- make sure to load this before all the other start plugins
    },
  },
  config = function()
    vim.cmd [[colorscheme gruvbox-minor]]
  end,
}
