local config = require "config"
local custom = config.generals

return {
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  "MunifTanjim/nui.nvim",

  { "windwp/nvim-ts-autotag", enabled = true, lazy = true },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      disable_in_macro = false,
    },
  },

  { "christoomey/vim-tmux-navigator", event = "VeryLazy" },

  { "folke/lsp-colors.nvim", event = "BufEnter" },

  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {
      hooks = {
        pre = function()
          require("ts_context_commentstring.internal").update_commentstring {}
        end,
      },
    },
    config = function(_, opts)
      require("Comment").setup(opts)
    end,
  },

  -- Higlight words
  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    opts = { delay = 200 },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },

  -- indent guides for Neovim
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    enabled = function()
      if config.zen_mode then
        return false
      end
      return true
    end,
    opts = {
      filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
      show_trailing_blankline_indent = false,
      show_current_context = custom.indent_blankline.show_current_context,
      show_current_context_start = custom.indent_blankline.show_current_context_start,
    },
  },
}
