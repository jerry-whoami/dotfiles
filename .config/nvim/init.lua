local config = require("config")

-- Require globals
require("core.globals")

-- Setup plugin manager
require("core.lazy")

-- Colorscheme
vim.cmd("colorscheme catppuccin-mocha")
vim.cmd("colorscheme catppuccin-mocha")
vim.cmd([[hi WinSeparator guifg=bg guibg=bg gui=none]])
vim.cmd([[hi statusline guifg=bg guibg=bg gui=none]])
vim.cmd([[hi StatusLineNc guifg=bg guibg=bg gui=none]])

-- Keymaps
local keymapConfig = require("core.keymaps")
for mode, mode_mappings in pairs(keymapConfig.keymaps) do
	local opts = (mode == "t") and keymapConfig.options.term_opts or keymapConfig.options.default
	for keymap, command in pairs(mode_mappings) do
		vim.keymap.set(mode, keymap, command, opts)
	end
end

-- Options
local options = require("core.options")
for index, value in pairs(options) do
	vim.opt[index] = value
end

vim.opt.shortmess:append("c") -- don't show redundant messages from ins-completion-menu
vim.opt.whichwrap:append("<,>,[,],h,l") -- for line wrapping
vim.opt.iskeyword:append("-") -- Include - as part of a word
vim.opt.fillchars:append("vert: ") -- Set vertical split as a space

-- Disable providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

require("core.autocmds")
