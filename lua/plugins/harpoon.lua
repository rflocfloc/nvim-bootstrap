return {
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
      { "<leader>aa", function() 
	require("harpoon"):list():add()
	vim.notify "file harpooned" 
      end, desc = "H[a]rpoon [A]ppend", },
      { "<leader>at", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "H[a]rpoon [T]oggle menu", },
      { "<leader>aj", function() require("harpoon"):list():select(1) end, desc = "H[a]rpoon to file [j] 1", },
      { "<leader>ak", function() require("harpoon"):list():select(2) end, desc = "H[a]rpoon to file [k] 2", },
      { "<leader>al", function() require("harpoon"):list():select(3) end, desc = "H[a]rpoon to file [l] 3", },
      { "<leader>a;", function() require("harpoon"):list():select(4) end, desc = "H[a]rpoon to file [;] 4", },
    },
  },
}
