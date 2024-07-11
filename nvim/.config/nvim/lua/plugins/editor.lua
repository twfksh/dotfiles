return {
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

	--{ -- vscode like winbar for neovim
	--	'utilyre/barbecue.nvim',
	--	name = 'barbecue',
	--	version = '*',
	--	dependencies = {
	--		'SmiteshP/nvim-navic',
	--		'nvim-tree/nvim-web-devicons', -- optional dependency
	--	},
	--	opts = {
	--		-- configurations go here
	--	},
	--},

	{ -- Highlight todo, notes, etc in comments
		'folke/todo-comments.nvim',
		event = 'BufEnter',
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = { signs = false },
	},

	-- Heuristically set buffer options
	--{ 'tpope/vim-sleuth' },

	--{ 'NvChad/nvim-colorizer.lua', event = 'BufEnter', opts = {} },
}
