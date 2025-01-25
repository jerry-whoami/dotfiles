return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "intelephense",
        "html-lsp",
        "css-lsp",
        "typescript-language-server",
        "pyright",
        "tailwindcss-language-server",
        "emmet-ls",
        "json-lsp",
        "black",
        "blade-formatter",
        "prettierd",
        "rustywind",
        "vue-language-server",
        "yaml-language-server",
        "php-cs-fixer",
        "lua-language-server",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = function()
      return {
        diagnostics = {
          underline = true,
          update_in_insert = false,
          virtual_text = false,
          severity_sort = true,
          signs = {
            text = {
              [vim.diagnostic.severity.ERROR] = LazyVim.config.icons.diagnostics.Error,
              [vim.diagnostic.severity.WARN] = LazyVim.config.icons.diagnostics.Warn,
              [vim.diagnostic.severity.HINT] = LazyVim.config.icons.diagnostics.Hint,
              [vim.diagnostic.severity.INFO] = LazyVim.config.icons.diagnostics.Info,
            },
          },
        },
        inlay_hints = {
          enabled = true,
          exclude = {},
        },
        codelens = {
          enabled = false,
        },
        document_highlight = {
          enabled = true,
        },
        capabilities = {
          workspace = {
            fileOperations = {
              didRename = true,
              willRename = true,
            },
          },
        },
        format = {
          formatting_options = nil,
          timeout_ms = nil,
        },
        -- LSP Server Settings
        servers = {
          ["html"] = {
            filetypes = {
              "html",
              "blade",
            },
          },
          ["emmet_ls"] = {
            filetypes = {
              "html",
              "blade",
              "typescriptreact",
              "javascriptreact",
              "css",
              "sass",
              "scss",
              "less",
              "eruby",
            },
          },
        },
        setup = {},
      }
    end,
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        php = { "php_cs_fixer" },
      },
    },
  },
}
