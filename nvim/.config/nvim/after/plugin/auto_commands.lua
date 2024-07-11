-- make sure the file type is set to term on terminal open
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.cmd.set "filetype=term"
  end,
})

-- We create a grop which will be cleared each time, this is so we don't have multiple autocommands running (or something like that)
local group = vim.api.nvim_create_augroup("dummy", { clear = true })

-- highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = group,
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Clear whitespace on save and format code
--vim.api.nvim_create_autocmd("BufWritePre", {
--  callback = function()
--    -- This is scuffed, but lua won't let me use \ to escapee a Character, and
--    -- vim does not like it when you use |
--    vim.cmd([[:%s/\s\+$//e]])
--    vim.lsp.buf.format()
--  end,
--  group = group
--})

-- Stuff on save
--vim.cmd([[
--autocmd BufWritePost ~/.dotfiles/.bookm !~/.local/bin/bookmarks --lf && ~/.local/bin/bookmarks --shell
--autocmd BufWritePost ~/.dotfiles/.bookmfiles !~/.local/bin/bookmarks --shell-files
--]])
