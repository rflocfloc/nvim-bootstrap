return {
  -- Extend and create a/i textobjects.
  { 'echasnovski/mini.ai', version = '*' },

  -- Comment lines, see comands gc, gcc.
  { 'echasnovski/mini.comment', version = '*' },

  -- Surrounding actions, see commands sa, sd, sh, sr, etc.
  { 'echasnovski/mini.surround', version = '*' },

  -- Minimal and fast autopairs
  { 'echasnovski/mini.pairs', version = '*' },

  -- Move any selection in any direction, with = adjust indent.
  { 'echasnovski/mini.move', 
    version = '*',
    opts = {
      mappings = {
        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
        left = "<A-h>",
        right = "<A-l>",
        down = "<A-j>",
        up = "<A-k>",
        -- Move current line in Normal mode
        line_left = "<A-h>",
        line_right = "<A-l>",
        line_down = "<A-j>",
        line_up = "<A-k>",
      },
    },
  },

  -- Split and join arguments using gS
  {'echasnovski/mini.splitjoin', version = '*' },

  -- Visualize and work with indent scope
  { 'echasnovski/mini.indentscope', 
    version = '*',
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts = {
      options = { try_as_border = true },
      symbol = "│",
    },
  },

  -- Detect tabstop and shiftwidth automatically
  { 'NMAC427/guess-indent.nvim' },

  -- Flash enhances the built-in search functionality by showing labels at the end of each match, letting you quickly jump to a specific location.
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    ---@type Flash.Config
    opts = { },
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
  },

   -- Finds and lists all of the TODO, HACK, WARN, PERF, NOTE, TEST, FIX, FIXME, etc comment
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    config= function()
      local todo_comments = require("todo-comments")
      todo_comments.setup()
    end,
    keys = {
      { "<leader>tt", function() Snacks.picker.todo_comments() end, desc = "[T]odo [T]oggle search" },
      { "<leader>tn", function() require("todo-comments").jump_next() end, desc = "[T]odo [N]ext comment" },
      { "<leader>tp", function() require("todo-comments").jump_prev() end, desc = "[T]odo [P]revious comment" },
    },
  },

  -- Pin point buffers and jump between them with shortcut
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {"nvim-lua/plenary.nvim"},
    opts = {
      menu = {
	width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
	save_on_toggle = true,
      },
    },
    config = function()
      require("harpoon"):setup()
    end,
    keys = {
      { "<leader>aa", function() require("harpoon"):list():add() end, desc = "H[a]rpoon [A]ppend", },
      { "<leader>at", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "H[a]rpoon [T]oggle menu", },
      { "<leader>aj", function() require("harpoon"):list():select(1) end, desc = "H[a]rpoon to file [j] 1", },
      { "<leader>ak", function() require("harpoon"):list():select(2) end, desc = "H[a]rpoon to file [k] 2", },
      { "<leader>al", function() require("harpoon"):list():select(3) end, desc = "H[a]rpoon to file [l] 3", },
      { "<leader>a;", function() require("harpoon"):list():select(4) end, desc = "H[a]rpoon to file [;] 4", },
    },
  },
}
