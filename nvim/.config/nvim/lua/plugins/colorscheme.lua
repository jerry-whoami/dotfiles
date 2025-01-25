return {
  -- catppuccin
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      custom_highlights = function(colors)
        return {
          WinSeparator = { fg = colors.base },
          AlphaLogo = { fg = colors.lavender },
          NeoTreeNormal = { bg = colors.base },
          NeoTreeNormalNC = { bg = colors.base },
          NeoTreeDirectoryName = { fg = colors.text },
          NeoTreeFileName = { fg = colors.text },
          NormalFloat = { bg = colors.base },
          FloatBorder = { fg = colors.lavender },
          StatusLine = { bg = colors.base },
          StatusLineNC = { bg = colors.base },

          BlinkCmpMenu = { fg = colors.base },
        }
      end,
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        blink_cmp = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        fzf = true,
        telescope = {
          enabled = true,
          style = "nvchad",
        },
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },
}
