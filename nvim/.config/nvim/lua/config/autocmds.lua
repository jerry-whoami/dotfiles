local function augroup(name)
  return vim.api.nvim_create_augroup("whoami." .. name, { clear = true })
end

-- Add support for blade files
vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup("blade_support"),
  pattern = { "*.blade.php" },
  callback = function()
    vim.notify("Neovim has started!", vim.log.levels.INFO)
    vim.treesitter.language.register("html", "blade")

    vim.cmd("setlocal filetype=blade")
  end,
})
