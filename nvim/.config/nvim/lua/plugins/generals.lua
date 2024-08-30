return {
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  "MunifTanjim/nui.nvim",

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      disable_in_macro = false,
    },
  },

  { "christoomey/vim-tmux-navigator", event = "VeryLazy" },

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
}
