return {
   -- Finds and lists all of the TODO, HACK, WARN, PERF, NOTE, TEST, FIX, FIXME, etc comment
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    config= function()
      local todo_comments = require("todo-comments")
      todo_comments.setup()
    end,
    keys = {
      { "<leader>tt", function() require("todo-comments.snacks").pick() end, desc = "[T]odo [T]oggle search" },
      { "<leader>tn", function() require("todo-comments").jump_next() end, desc = "[T]odo [N]ext comment" },
      { "<leader>tp", function() require("todo-comments").jump_prev() end, desc = "[T]odo [P]revious comment" },
    },
  },
}
