return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        -- "<A-1>",
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
        end,
        desc = "Explorer NeoTree (Root Dir)",
      },
      { "<leader>fe", false },
      { "<leader>fE", false },
      -- { "<leader>e", false },
      { "<leader>E", false },
      { "<leader>be", false },
    },
    opts = {
      close_if_last_window = true,
      popup_border_style = "rounded",
      window = {
        position = "right",
        mappings = {
          ["l"] = false,
          ["h"] = false,
          ["<space>"] = false,
        },
      },
      default_component_configs = {
        icon = {
          folder_closed = "",
          folder_open = "󰉖",
          folder_empty = "󰉖",
        },
        indent = {
          with_markers = false,
        },
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {},
          hide_by_pattern = {},
        },
        components = {
          name = function(config, node, state)
            if node:get_depth() == 1 then
              local root_name = ""

              local root_path = vim.fn.fnamemodify(node.path, ":~")
              root_name = vim.fn.fnamemodify(root_path, ":t") .. " "

              return {
                {
                  highlight = "NeoTreeDirectoryName",
                  text = root_name,
                },
                {
                  highlight = "NeoTreeDimText",
                  text = root_path,
                },
              }
            end

            if node.type == "directory" then
              return {
                highlight = "NeoTreeDirectoryName",
                text = node.name,
              }
            end

            local highlight = "NeoTreeFileName"
            if config.use_git_status_colors == nil or config.use_git_status_colors then
              local git_status = state.components.git_status({}, node, state)
              if git_status and git_status.highlight then
                highlight = git_status.highlight
              end
            end

            return {
              text = node.name,
              highlight = highlight,
            }
          end,
        },
      },
      event_handlers = {
        {
          event = "neo_tree_window_after_open",
          handler = function(args)
            if args.position == "left" or args.position == "right" then
              vim.cmd("wincmd =")
            end
          end,
        },
        {
          event = "neo_tree_window_after_close",
          handler = function(args)
            if args.position == "left" or args.position == "right" then
              vim.cmd("wincmd =")
            end
          end,
        },
        {
          event = "file_open_requested",
          handler = function()
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>fa", "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", desc = "Find All" },
      { "<leader>fr", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (cwd)" },
      { "<leader>fR", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics" },
      { "<leader>sg", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
      { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
      { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
      { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
      { "<leader>sw", LazyVim.pick("grep_string", { word_match = "-w" }), desc = "Word (Root Dir)" },
      { "<leader>sw", LazyVim.pick("grep_string"), mode = "v", desc = "Selection (Root Dir)" },
      { "<leader>uC", LazyVim.pick("colorscheme", { enable_preview = true }), desc = "Colorscheme with Preview" },

      { '<leader>s"', false },
      { "<leader>sa", false },
      { "<leader>sj", false },
      { "<leader>sl", false },
      { "<leader>sm", false },
      { "<leader>sq", false },
      { "<leader>sW", false },
      { "<leader>sW", false },
      { "<leader>sb", false },
      { "<leader>ss", false },
      { "<leader>sS", false },
    },
    opts = function()
      local actions = require("telescope.actions")

      local open_with_trouble = function(...)
        return require("trouble.sources.telescope").open(...)
      end
      local find_all_files = function()
        local action_state = require("telescope.actions.state")
        local line = action_state.get_current_line()
        LazyVim.pick("find_files", { hidden = true, no_ignore = true, default_text = line })()
      end

      return {
        defaults = {
          prompt_prefix = "   ",
          selection_caret = " ",
          entry_prefix = "  ",
          results_title = "",
          borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
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
          mappings = {
            n = {
              ["q"] = actions.close,
            },
            i = {
              ["<A-a>"] = find_all_files,
              ["<A-t>"] = open_with_trouble,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-Down>"] = actions.cycle_history_next,
              ["<C-Up>"] = actions.cycle_history_prev,
              ["<A-j>"] = actions.preview_scrolling_down,
              ["<A-k>"] = actions.preview_scrolling_up,
              ["<Down>"] = false,
              ["<Up>"] = false,
              ["<C-t>"] = false,
              ["<C-f>"] = false,
              ["<C-b>"] = false,
            },
          },
        },
      }
    end,
  },
}
