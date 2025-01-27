vim.opt.background = 'dark'
vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true

vim.opt.wrap = true

vim.opt.mouse = 'a'

vim.opt.showmode = false

-- allow plugins i.e. undotree to work well
vim.opt.undofile = true
vim.opt.undodir = os.getenv 'HOME' .. '/.local/share/nvim/undodir'
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.incsearch = true
vim.opt.smartcase = true

vim.opt.breakindent = true
vim.opt.linebreak = true

vim.opt.title = true

vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 50
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.cursorline = true

vim.opt.colorcolumn = '100'

vim.opt.conceallevel = 0

-- make the complete menu in command mode better
vim.opt.pumblend = 17
vim.opt.wildmode = 'longest:full'
vim.opt.wildoptions = 'pum'

vim.opt.scrolloff = 5

vim.opt.laststatus = 3

-- vim.opt.listchars = { eol = '↲' }
-- vim.opt.listchars = 'tab:· ,nbsp:_,trail: ,multispace:· ,eol:↲'
-- vim.opt.listchars = { eol = '↲', tab = '>', space = '>' }
-- vim.opt.listchars = { eol = '↲' }

vim.opt.shell = '/bin/zsh'
