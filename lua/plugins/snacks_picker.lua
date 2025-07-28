return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      explorer = { enabled = true },
      picker = { 
	enabled = true,
        layout = "telescope"
      },
      bigfile = { enabled = true },
      quickfile = { enabled = true },
      image = { enabled = true },
      indent = { enabled = false },
      animate = { enabled = false },
      rename = { enabled = false },
      input = { enabled = false },
      notifier = { enabled = false },
      scope = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      words = { enabled = false },
    },

    keys = {
      -- search
      { "<leader>sf", function() Snacks.picker.files() end, desc = "[S]earch [F]iles" },
      {"<leader>sn", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "[S]earch [N]eovim files" },
      { "<leader>sp", function() Snacks.picker.projects() end, desc = "[S]earch [P]rojects" },
      { "<leader>sH", function() Snacks.picker.files({cwd = "/home" }) end, desc = "[S]earch files in [H]ome" },
      { "<leader>sR", function() Snacks.picker.files({cwd = "/" }) end, desc = "[S]earch files in [R]oot" },
      { "<leader>sk", function() Snacks.picker.keymaps({ layout = "select"}) end, desc = "[S]earch [K]eymaps" },
      { "<leader>sh", function() Snacks.picker.help() end, desc = "[S]earch [H]elp" },
       -- grep
      { "<leader>s/", function() Snacks.picker.grep_buffers() end, desc = "[S]earch [/] in Open Files" },
      { "<leader>sg", function() Snacks.picker.grep() end, desc = "[S]earch by [G]rep" },
      { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "[S]earch current [W]ord", mode = { "n", "x" }},
      -- top pickers
      { "<leader><leader>", function() Snacks.picker.buffers({
            -- Start buffers picker in normal mode
            on_show = function()
              vim.cmd.stopinsert()
            end,
            finder = "buffers",
            format = "buffer",
            hidden = false,
            unloaded = true,
            current = true,
            sort_lastused = true,
            win = {
              input = {
                keys = {
                  ["d"] = "bufdelete",
                },
              },
              list = { keys = { ["d"] = "bufdelete" } },
            },
            layout = "select",
      })
      end, desc = "[ ] Existing Buffers"},
    { "<leader>e", function() Snacks.explorer({ layout = "vertical"}) end, desc = "File [E]xplorer" },
    },
  },
}
