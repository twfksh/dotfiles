local M = {}

-- keymap utils
local function bind(op, outer_opts)
  outer_opts = vim.tbl_extend('force', { noremap = true, silent = true }, outer_opts or {})

  return function(lhs, rhs, opts)
    opts = vim.tbl_extend('force', outer_opts, opts or {})
    vim.keymap.set(op, lhs, rhs, opts)
  end
end

M.map = bind ''
M.nmap = bind('n', { noremap = false })
M.nnoremap = bind 'n'
M.vnoremap = bind 'v'
M.xnoremap = bind 'x'
M.inoremap = bind 'i'
M.tnoremap = bind 't'

-- git utils
M.is_git_directory = function()
  local result = vim.fn.system 'git rev-parse --is-inside-work-tree'
  if vim.v.shell_error == 0 and result:find 'true' then
    return true
  else
    return false
  end
end

-- Define a function to delete directories using rm -rf
M.delete_directory = function(directory)
  vim.fn.system('rm -rf ' .. vim.fn.shellescape(directory))
end

return M
