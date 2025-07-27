return {
  { -- Detect tabstop and shiftwidth automatically
    'NMAC427/guess-indent.nvim' 
  },

  { -- Pin point buffers and jump between them with shortcut
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
    keys = function()
      local keys = {
	{
	  "<leader>hf",
	  function()
	    require("harpoon"):list():add()
	  end,
	  desc = "[H]arpoon [F]ile",
	},
	{
	  "<leader>ht",
	  function()
	    local harpoon = require("harpoon")
	    harpoon.ui:toggle_quick_menu(harpoon:list())
	  end,
	  desc = "[H]arpoon [T]oggle menu",
	},
      }

      for i = 1, 5 do
	table.insert(keys, {
	  "<C>" .. i,
	  function()
	    require("harpoon"):list():select(i)
	  end,
	  desc = "Harpoon to File " .. i,
	})
      end
      return keys
    end,
  },

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      -- this setting is independent of vim.o.timeoutlen
      delay = 0,
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- Document existing key chains
      -- Modify this is you want to add entry on leader menu
      spec = {
        { '<leader>s', group = '[S]earch'},
        { '<leader>t', group = '[T]oggle' },
        { '<leader>g', group = 'LSP: [G]oto' },
        { '<leader>H', group = 'Git [H]unk', mode = { 'n', 'v' } },
        { '<leader>w', group = '[W]indow' },
        { '<leader>h', group = '[H]arpoon' },
      },
    },
  },

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      indent = {
        -- Adds indent lines
        enabled = true
      },
      rename = {
        -- LSP-integrated file renaming with support for plugins like nvim-tree.nvim
        enabled = true
      },
      explorer = {
        -- A file explorer for snacks
        enabled = true
      },
      scope = {
        -- Scope detection based on treesitter or indent.
        enabled = true
      },
      scroll = {
        enabled = false
      },
      statuscolumn = {
        enabled = false
      },
      words = {
	-- Auto-show LSP references and quickly navigate between them
        enabled = true
      },
    },

    keys = {
      -- search
      { "<leader>sf", function() Snacks.picker.files() end, desc = "[S]earch [F]iles" },
      {"<leader>sn", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "[S]earch [N]eovim files" },
      { "<leader>sp", function() Snacks.picker.projects() end, desc = "[S]earch [P]rojects" },
      { "<leader>sk", function() Snacks.picker.keymaps({ layout = ""}) end, desc = "[S]earch [K]eymaps" },
      { "<leader>sh", function() Snacks.picker.help() end, desc = "[S]earch [H]elp" },
       -- grep
      { "<leader>s/", function() Snacks.picker.grep_buffers() end, desc = "[S]earch [/] in Open Files" },
      { "<leader>sg", function() Snacks.picker.grep() end, desc = "[S]earch by [G]rep" },
      { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "[S]earch current [W]ord", mode = { "n", "x" }},
      -- top pickers
      { "<leader>e", function() Snacks.explorer({ layout = "vertical"}) end, desc = "File [E]xplorer" },
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
      end, desc = "[ ] Find existing buffers"},
    }
  }

}
