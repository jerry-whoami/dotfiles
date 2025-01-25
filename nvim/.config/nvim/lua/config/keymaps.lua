local map = vim.keymap.set
local delete = vim.keymap.del

-- Copy whole file
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "Copy whole file" })

-- Quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- go up and down through command history
map("c", "<C-k>", function()
  if vim.fn.wildmenumode() == 1 then
    return "<C-k>"
  else
    return "<Up>"
  end
end, { expr = true, desc = "Navigate completion menu up" })
map("c", "<C-j>", function()
  if vim.fn.wildmenumode() == 1 then
    return "<C-j>"
  else
    return "<Down>"
  end
end, { expr = true, desc = "Navigate completion menu down" })

-- Window management
map("n", "<leader>ww", "<C-W>p", { desc = "Other Window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
map("n", "<leader>wk", "<cmd>leftabove split<cr>", { desc = "Split Window Below", remap = true })
map("n", "<leader>wj", "<cmd>rightbelow split<cr>", { desc = "Split Window Right", remap = true })
map("n", "<leader>wl", "<cmd>rightbelow vsplit<cr>", { desc = "Split Window Below", remap = true })
map("n", "<leader>wh", "<cmd>leftabove vsplit<cr>", { desc = "Split Window Right", remap = true })
delete("n", "<leader>-")
delete("n", "<leader>|")

-- Substitute the selected text with clipboard text
vim.keymap.set("v", "p", '"_dP', { desc = "Substitute the selected text", remap = true })
