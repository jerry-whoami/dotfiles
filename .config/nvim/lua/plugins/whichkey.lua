local utils = require "core.utils"

local options = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode

    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
  },

  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },

  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },

  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },

  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 15, -- spacing between columns
    align = "center", -- align columns left, center or right
  },

  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  show_keys = true, -- show the currently pressed key and its label as a message in the command line
  triggers = { "<leader>" }, -- or specify a list manually

  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    i = { "j", "k" },
    v = { "j", "k" },
  },

  disable = {
    buftypes = {},
    filetypes = { "TelescopePrompt" },
  },
}

local mappings = {
  [";"] = { "<cmd>Alpha<CR>", "Dashboard" },
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting (noautocmd)" },
  ["q"] = { utils.smart_quit, "Quit" },
  ["x"] = { utils.smart_buffer_close, "Close Buffer" },
  ["L"] = { "<cmd>Lazy<cr>", "Open Lazy Manager" },
  n = {
    name = "Notifications",
    d = { "<cmd>lua require('notify').dismiss({ silent = true, pending = true })<cr>", "Delete all Notifications" },
    h = { "<cmd>Telescope notify<cr>", "History" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  enabled = false,
  config = function()
    local status, which_key = pcall(require, "which-key")
    if not status then
      return
    end

    which_key.setup(options)
    which_key.register(mappings, opts)
  end,
}
