return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ignore_install = { "yaml.ansible" },
    ensure_installed = {
      "php",
      "dockerfile",
      "sql",
      "vue",
    },
  },
  config = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      opts.ensure_installed = LazyVim.dedup(opts.ensure_installed)
    end

    require("nvim-treesitter.configs").setup(opts)

    vim.treesitter.language.register("yaml", "yaml.ansible")
  end,
}
