return {
  {
    "snacks.nvim",
    opts = {
      terminal = { enabled = false },
      zen = { enabled = false },
      profiler = { enabled = false },
    },
  },

  {
    "folke/noice.nvim",
    opts = {
      views = {
        hover = {
          position = { row = 2, col = 0 },
          border = {
            style = "rounded",
            padding = { 0, 2 },
          },
        },
      },
    },
  },

  {
    "rebelot/heirline.nvim",
    opts = function()
      local config = require("plugins.config.heirline")
      local utils = require("heirline.utils")
      local conditions = require("heirline.conditions")

      return {
        opts = {
          colors = config.colors,
        },
        statusline = {
          static = {
            mode_colors_map = {
              n = { fg = "mantle", bg = "blue" },
              i = { fg = "base", bg = "green" },
              r = { fg = "base", bg = "red" },
              R = { fg = "base", bg = "green" },
              v = { fg = "base", bg = "mauve" },
              V = { fg = "base", bg = "mauve" },
              ["\22"] = { fg = "base", bg = "mauve" },
              s = { fg = "base", bg = "mauve" },
              S = { fg = "base", bg = "mauve" },
              ["\19"] = { fg = "base", bg = "mauve" },
              c = { fg = "base", bg = "peach" },
              ["!"] = { fg = "base", bg = "peach" },
              t = { fg = "base", bg = "green" },
            },
            mode_color = function(self)
              local mode = conditions.is_active() and vim.fn.mode() or "n"
              return self.mode_colors_map[mode]
            end,
          },
          condition = function()
            return not conditions.buffer_matches({
              buftype = { "prompt", "help", "quickfix", "nofile" },
            })
          end,
          {
            hl = { bg = "base" },
            utils.surround({ "█", "█" }, function(self)
              return self:mode_color().bg
            end, config.components.vim_mode),
          },
          {
            hl = function(self)
              return { fg = self:mode_color().bg, bg = "crust" }
            end,
            { provider = "" },
          },
          {
            hl = { bg = "base" },
            utils.surround({ "█", "█" }, "crust", {
              {
                provider = function()
                  return vim.bo.modified and " 󰑊 " or ""
                end,
                hl = { fg = "green", bg = "crust" },
              },
              config.components.file_name,
            }),
          },
          config.components.git,
          config.components.align,
          {
            hl = { bg = "base" },
            utils.surround({ "█", "█" }, "peach", config.components.ruler),
          },
        },
      }
    end,
  },

  {
    "goolord/alpha-nvim",
    lazy = false,
    dependencies = {
      { "rubiin/fortune.nvim" },
    },
    opts = function()
      local config = require("plugins.config.dashboard")

      return {
        layout = {
          { type = "padding", val = config.padding(config.themes.lambda) - 1 },
          {
            type = "text",
            val = config.themes.lambda,
            opts = { hl = "AlphaLogo", position = "center" },
          },
          {
            type = "text",
            val = function()
              return require("fortune").get_fortune()
            end,
            opts = { hl = "Text", position = "center" },
          },
        },
        opts = {},
      }
    end,
  },
}
