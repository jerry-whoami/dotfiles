local M = {}
M.components = {}
local components = M.components
local conditions = require("heirline.conditions")

-- Configuration options
M.colors = require("catppuccin.palettes").get_palette("mocha")

-- Utility Components
components.align = { provider = "%=" }
components.space = { provider = " " }

-- Components
components.vim_mode = {
  static = {
    mode_names = {
      n = "Normal",
      no = "Normal",
      nov = "Normal",
      noV = "Normal",
      ["no\22"] = "Normal",
      niI = "Normal",
      niR = "Normal",
      niV = "Normal",
      nt = "Normal",
      v = "Visual",
      vs = "Visual",
      V = "Visual",
      Vs = "Visual",
      ["\22"] = "Visual",
      ["\22s"] = "Visual",
      s = "Select",
      S = "Select",
      ["\19"] = "Select",
      i = "Insert",
      ic = "Insert",
      ix = "Insert",
      R = "Replace",
      Rc = "Replace",
      Rx = "Replace",
      Rv = "Replace",
      Rvc = "Replace",
      Rvx = "Replace",
      c = "Command",
      cv = "Ex",
      r = "...",
      rm = "M",
      ["r?"] = "?",
      ["!"] = "!",
      t = "T",
    },
  },
  provider = function(self)
    return "󱄛 " .. self.mode_names[vim.fn.mode(1)]
  end,
  hl = function(self)
    return self:mode_color()
  end,
  update = {
    "ModeChanged",
    pattern = "*:*",
    callback = vim.schedule_wrap(function()
      vim.cmd("redrawstatus")
    end),
  },
}

components.file_name = {
  provider = function(self)
    local file_name = vim.api.nvim_buf_get_name(0)
    local name = vim.fn.fnamemodify(file_name, ":t")
    if name == "" then
      return ""
    end

    if not conditions.width_percent_below(#file_name, 0.25) then
      file_name = vim.fn.pathshorten(file_name)
    end

    return name
  end,
  hl = { fg = "text", bg = "crust" },
}

components.git = {
  condition = conditions.is_git_repo,

  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,

  hl = { fg = "text", bg = "mantle" },

  -- git branch name
  {
    provider = "  ",
    hl = { fg = "peach" },
  },
  {
    provider = function(self)
      return self.status_dict.head
    end,
  },
  -- Git added
  {
    provider = "  ",
    hl = { fg = "lavender" },
  },
  {
    provider = function(self)
      local count = self.status_dict.added or 0
      return count
    end,
  },
  -- Git deleted
  {
    provider = "  ",
    hl = { fg = "lavender" },
  },
  {
    provider = function(self)
      local count = self.status_dict.removed or 0
      return count
    end,
  },
  -- Git changed
  {
    provider = "  ",
    hl = { fg = "lavender" },
  },
  {
    provider = function(self)
      local count = self.status_dict.changed or 0
      return count
    end,
  },
}

components.ruler = {
  hl = { fg = "base", bg = "peach" },
  {
    provider = " ",
  },
  {
    provider = "%l:%c",
  },
  {
    provider = "   ",
  },
  {
    provider = "%P",
  },
  -- %l = current line number
  -- %L = number of lines in the buffer
  -- %c = column number
  -- %P = percentage through file of displayed window
}

return M
