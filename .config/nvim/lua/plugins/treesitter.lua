return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPre",
    enabled = true,
    opts = { mode = "cursor" },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    -- enabled = false,
    dependencies = {
      "p00f/nvim-ts-rainbow",
      "windwp/nvim-ts-autotag",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    event = "BufReadPost",
    opts = {
      ensure_installed = "all",
      sync_install = false,
      ignore_install = { "help" }, -- List of parsers to ignore installing
      indent = { enable = true, disable = { "yaml" } },
      autopairs = {
        enable = true,
      },
      autotag = {
        enable = true,
        filetypes = {
          "html",
          "blade",
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
          "svelte",
          "vue",
          "tsx",
          "jsx",
          "rescript",
          "xml",
          "php",
          "markdown",
          "glimmer",
          "handlebars",
          "hbs",
        },
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = true,
      },
    },
    config = function(_, opts)
      vim.treesitter.language.register("html", "blade")
      -- local parser = require("nvim-treesitter.parsers").filetype_to_parsername
      -- parser.blade = "html"

      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
