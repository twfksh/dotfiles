local Plugin = {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
}

Plugin.config = function()
  local harpoon = require 'harpoon'
  local nnoremap = require('config.utils').nnoremap

  harpoon:setup()

  local conf = require('telescope.config').values
  local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
      table.insert(file_paths, item.value)
    end

    require('telescope.pickers')
      .new({}, {
        prompt_title = 'Harpoon',
        finder = require('telescope.finders').new_table {
          results = file_paths,
        },
        previewer = conf.file_previewer {},
        sorter = conf.generic_sorter {},
      })
      :find()
  end

  nnoremap('<C-h>', function()
    harpoon:list():select(1)
  end)
  nnoremap('<C-t>', function()
    harpoon:list():select(2)
  end)
  nnoremap('<C-n>', function()
    harpoon:list():select(3)
  end)
  nnoremap('<C-s>', function()
    harpoon:list():select(4)
  end)

  -- toggle previous & next buffers stored within Harpoon list
  nnoremap('<C-S-P>', function()
    harpoon:list():prev()
  end)
  nnoremap('<C-S-N>', function()
    harpoon:list():next()
  end)

  nnoremap('<s-m>', function()
    harpoon:list():add()
    vim.notify '󱡅  marked file'
  end)

  nnoremap('<leader>h', function()
    toggle_telescope(harpoon:list())
  end, { desc = 'Toggle [h]arpoon' })
end

return Plugin
