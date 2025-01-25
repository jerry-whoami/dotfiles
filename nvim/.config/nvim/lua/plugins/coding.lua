local function border(highlight)
  return {
    { "╭", highlight },
    { "─", "highlight" },
    { "╮", "highlight" },
    { "│", "highlight" },
    { "╯", "highlight" },
    { "─", "highlight" },
    { "╰", "highlight" },
    { "│", "highlight" },
  }
end

return {
  {
    "saghen/blink.cmp",
    opts = {
      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
      },

      completion = {
        accept = {
          -- experimental auto-brackets support
          auto_brackets = {
            enabled = true,
          },
        },
        menu = {
          border = border("FloatBorder"),
          draw = {
            treesitter = { "lsp" },
          },
        },
        documentation = {
          window = {
            border = border("FloatBorder"),
          },
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        ghost_text = {
          enabled = vim.g.ai_cmp,
        },
      },

      sources = {
        -- adding any nvim-cmp sources here will enable them
        -- with blink.compat
        compat = {},
        default = { "lsp", "path", "snippets", "buffer" },
        cmdline = {},
      },

      keymap = {
        preset = "enter",
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-u>"] = { "scroll_documentation_up", "fallback" },
        ["<C-d>"] = { "scroll_documentation_down", "fallback" },
        ["<C-y>"] = { "select_and_accept" },
        ["<Tab>"] = {
          LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
          "fallback",
        },
      },
    },
  },
}
