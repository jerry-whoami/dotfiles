local M = {}

M.opts = {
  laststatus = 0,
  cmdheight = 0,
  foldcolumn = "6",
}

M.setup = function()
  vim.cmd [[hi WinSeparator guifg=bg guibg=bg gui=none]]
  vim.cmd [[hi statusline guifg=bg guibg=bg gui=none]]
  vim.cmd [[hi StatusLineNc guifg=bg guibg=bg gui=none]]
end

return M
