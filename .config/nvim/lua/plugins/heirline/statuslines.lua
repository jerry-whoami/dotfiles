local components = require("plugins.heirline.components")
local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local M = {}

M.TopBar = {
	fallthrough = false,
	components.None,
	{
		hl = { bg = "none" },
		-- hl = { bg = utils.get_highlight("TabLine").bg },
		{
			components.Space,
			components.FileInfo,
			components.Align,
			components.CursorPosition,
			components.Space,
		},
	},
}

M.WinBar = {
	fallthrough = false,
	components.None,
	{
		{
			condition = function()
				if vim.bo.buftype ~= "nofile" then
					return not conditions.is_active()
				end
			end,
			utils.surround(
				{ "", "" },
				utils.get_highlight("TabLine").bg,
				{ hl = { fg = utils.get_highlight("@comment").fg, force = true }, components.FileName }
			),
			hl = { bg = "none" },
		},
		{
			condition = function()
				if vim.bo.buftype ~= "nofile" then
					return conditions.is_active()
				end
			end,
			utils.surround(
				{ "", "" },
				utils.get_highlight("TabLine").bg,
				{ hl = { fg = utils.get_highlight("@comment.warning").bg, force = true }, components.FileName }
			),
			hl = { bg = "none" },
		},
	},
}

return M
