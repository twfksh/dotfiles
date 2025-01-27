local Plugin = { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' }

Plugin.config = function()
  require('nvim-treesitter.configs').setup {
    modules = {},
    ignore_install = {},
    ensure_installed = { 'c', 'cpp', 'lua', 'rust', 'python', 'bash', 'vim', 'vimdoc' },
    sync_install = false,
    auto_install = true,
    indent = {
      enable = true,
    },
    highlight = {
      enable = true,
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
      additional_vim_regex_highlighting = false,
    },
  }
end

return Plugin
