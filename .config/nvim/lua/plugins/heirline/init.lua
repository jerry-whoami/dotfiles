return {
	"rebelot/heirline.nvim",
	event = "VeryLazy",
	config = function()
		local heirline = require("heirline")
		local statuslines = require("plugins.heirline.statuslines")

		local opts = {
			winbar = statuslines.WinBar,
			-- tabline = statuslines.TopBar,
		}

		heirline.setup(opts)
	end,
}
