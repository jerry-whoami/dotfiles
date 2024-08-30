local utils = require "core.utils"

local M = {}

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

M.options = {
  default = { noremap = true, silent = true },
  term_opts = { silent = true },
}

M.keymaps = {
  n = {
    -- Save like a normal IDE
    ["<C-s>"] = "<cmd>w!<cr>",

    -- Vertical Navigation
    ["<C-d>"] = "<C-d>zz",
    ["<C-u>"] = "<C-u>zz",

    -- Window Navigation
    ["<C-h>"] = "<C-w>h",
    ["<C-j>"] = "<C-w>j",
    ["<C-k>"] = "<C-w>k",
    ["<C-l>"] = "<C-w>l",

    -- Resize Windows
    ["<C-Up>"] = "<cmd>resize +2<CR>",
    ["<C-Down>"] = "<cmd>resize -2<CR>",
    ["<C-Right>"] = "<cmd>vertical resize -2<CR>",
    ["<C-Left>"] = "<cmd>vertical resize +2<CR>",

    -- Move text up and down
    ["<A-k>"] = "<cmd>move .-2<CR>==",
    ["<A-j>"] = "<cmd>move .+1<CR>==",

    -- Buffer navigation
    ["<Tab>"] = "<cmd>BufferLineCycleNext<cr>",
    ["<S-Tab>"] = "<cmd>BufferLineCyclePrev<cr>",

    -- Substitute the every ocurrence of the word your on
    ["<leader>S"] = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",

    -- save and quit file
    ["<leader>w"] = "<cmd>w!<CR>",
    ["<leader>W"] = "<cmd>noautocmd w<cr>",
    ["<leader>q"] = utils.smart_quit,
    ["<leader>x"] = utils.smart_buffer_close,

    -- Lazy
    ["<leader>L"] = "<cmd>Lazy<cr>",

    -- Manage splits
    ["<leader>sv"] = "<cmd>vsplit<cr>",
    ["<leader>sh"] = "<cmd>split<cr>",
    ["<leader>sx"] = "<cmd>close<cr>",
    ["<leader>se"] = "<C-w>=",
  },
  i = {
    -- Save like a normal IDE
    ["<C-s>"] = "<cmd>w<cr>",

    -- Vertical Navigation
    ["<C-d>"] = "<C-d>zz",
    ["<C-u>"] = "<C-u>zz",
  },
  v = {
    -- Stay in indent mode after adding or removing tabs
    ["<"] = "<gv",
    [">"] = ">gv",

    -- Substitute the selected text with clipboard text
    ["p"] = '"_dP',
  },
  t = {
    -- Resize Windows
    ["<C-Up>"] = "<cmd>resize +2<CR>",
    ["<C-Down>"] = "<cmd>resize -2<CR>",

    -- Better terminal navigation
    ["<C-h>"] = "<C-\\><C-N><C-w>h",
    ["<C-l>"] = "<C-\\><C-N><C-w>l",
    ["<C-j>"] = "<C-\\><C-N><C-w>j",
    ["<C-k>"] = "<C-\\><C-N><C-w>k",
  },
}

return M
