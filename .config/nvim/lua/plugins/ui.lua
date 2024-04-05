return {
	-- Better ui for notifications
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		keys = {
			{
				"<leader>nd",
				"<cmd>lua require('notify').dismiss({ silent = true, pending = true })<cr>",
				"Delete all Notifications",
			},
			{ "<leader>nh", "<cmd>Telescope notify<cr>", desc = "History" },
		},
		opts = {
			timeout = 3000,
			level = 2,
			background_colour = "#000000",
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
		},
		config = function(_, opts)
			local notify = require("notify")
			vim.notify = notify

			notify.setup(opts)
		end,
	},

	-- better vim.ui
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		opts = {
			input = {
				relative = "editor",
				prefer_width = 50,
			},
			i = {
				["<C-k>"] = "HistoryPrev",
				["<C-j>"] = "HistoryNext",
			},
		},
	},

	{
		"xiyaowong/transparent.nvim",
		event = "VeryLazy",
		opts = {
			extra_groups = {
				"NormalFloat",
				"NeoTreeNormal",
				"NeoTreeNormalNC",
				"NeoTreeNormalTabActive",
				"TabLineFill",
				"WinSeparator",
				"VertSplit",
				"LineNr",
				"TelescopeNormal",
				"TelescopeBorder",
			},
		},
	},
}
