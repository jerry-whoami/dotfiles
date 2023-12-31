local floating_window = true
local toggle_key
if floating_window then
  toggle_key = "<cmd>Neotree toggle float reveal<cr>"
else
  toggle_key = "<cmd>Neotree toggle<cr>"
end

return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  init = function()
    vim.g.neo_tree_remove_legacy_commands = 1
    if vim.fn.argc() == 1 then
      local stat = vim.loop.fs_stat(vim.fn.argv(0))
      if stat and stat.type == "directory" then
        require "neo-tree"
      end
    end
  end,
  keys = {
    { "<leader>e", toggle_key, desc = "Explorer" },
  },
  opts = {
    close_if_last_window = true,
    floating_window = floating_window,
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    default_component_configs = {
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "ﰊ",
      },
      indent = {
        indent_size = 2,
        padding = 1, -- extra padding on left hand side
        with_markers = true,
        indent_marker = "│",
        last_indent_marker = "└",
        highlight = "NeoTreeIndentMarker",
        with_expanders = true,
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
    },
    filesystem = {
      window = {
        position = "right",
        width = "25%",
        popup = {
          position = { col = "100%", row = "2" },
          size = function(state)
            local root_name = vim.fn.fnamemodify(state.path, ":~")
            local root_len = string.len(root_name) + 4
            return {
              width = math.max(root_len, 40),
              height = vim.o.lines - 6,
            }
          end,
        },
      },
      follow_current_file = true,
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {},
        hide_by_pattern = {},
      },
    },
  },
}
