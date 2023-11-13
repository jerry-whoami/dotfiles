return {
  -- Better ui for notifications
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    keys = {
      d = {
        "<leader>nd",
        "<cmd>lua require('notify').dismiss({ silent = true, desc = pending = true })<cr>",
        "Delete all Notifications",
      },
      h = { "<leader>nh", "<cmd>Telescope notify<cr>", desc = "History" },
    },
    opts = {
      timeout = 3000,
      level = 2,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    },
    config = function(_, opts)
      local notify = require "notify"
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
}
