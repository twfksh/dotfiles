return {
  "tjdevries/colorbuddy.nvim",
  dependencies = {
    { "echasnovski/mini.base16", version = "*" },
    { "EdenEast/nightfox.nvim" },
    { "sainnhe/everforest" },
  },
  config = function ()
    vim.cmd[[colorscheme terafox]]
  end
}
