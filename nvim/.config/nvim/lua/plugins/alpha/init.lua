local themes = require "plugins.alpha.themes"

local padding = function()
  local window = vim.api.nvim_get_current_win()
  local win_height = vim.api.nvim_win_get_height(window)

  local logo_height = #themes["toxic"]

  return vim.fn.floor((win_height - logo_height) * 0.5)
end

return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  opts = {
    layout = {
      { type = "padding", val = padding() },
      {
        type = "text",
        val = themes["toxic"],
        opts = { hl = "AlphaLogo", position = "center" },
      },
    },
    opts = {},
  },
}
