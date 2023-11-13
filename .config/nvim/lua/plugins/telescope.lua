return {
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>fc",
        "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
        desc = "Colorscheme",
      },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fa", "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", desc = "Find All" },
      { "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Find Text" },
      { "<leader>fl", "<cmd>Telescope resume<cr>", desc = "Last Search" },
      { "<leader>fr", "<cmd>Telescope oldfiles hidden=true no_ignore=true<cr>", desc = "Recent File" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
      { "<leader>fC", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
    },
    dependencies = { "nvim-telescope/telescope-fzf-native.nvim" },
    cmd = "Telescope",
    opts = {
      defaults = {
        prompt_prefix = "   ",
        selection_caret = " ",
        entry_prefix = "  ",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        file_ignore_patterns = { "node_modules" },
        mappings = {
          n = {
            ["q"] = function(...)
              require("telescope.actions").close(...)
            end,
          },
          i = {
            ["<C-k>"] = function(...)
              require("telescope.actions").move_selection_previous(...)
            end,
            ["<C-j>"] = function(...)
              require("telescope.actions").move_selection_next(...)
            end,
            ["<a-a>"] = function()
              require("telescope.builtin").find_files { hidden = true, no_ignore = true }
            end,
            ["<C-Down>"] = function(...)
              return require("telescope.actions").cycle_history_next(...)
            end,
            ["<C-Up>"] = function(...)
              return require("telescope.actions").cycle_history_prev(...)
            end,
          },
        },
      },
    },
    config = function(_, opts)
      local telescope_setup, telescope = pcall(require, "telescope")
      if not telescope_setup then
        return
      end

      telescope.setup(opts)
      telescope.load_extension "notify"
      telescope.load_extension "fzf"
    end,
  },
}
