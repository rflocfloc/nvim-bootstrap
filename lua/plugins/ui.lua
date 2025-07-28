return {
  -- Icons mini.icons, need for statusline and which-key.
  { 'echasnovski/mini.icons', version = '*' },

  -- Icons based on NerdFonts, need for statusline and which-key.
  { 'nvim-tree/nvim-web-devicons', version = '*' },

  -- Status line.
  { 'nvim-lualine/lualine.nvim',
    opts = {
      icons_enabled = true,
      theme = 'auto',
      sections = { -- sections of the status bar from left to right ( A | B | C ------------ X | Y | Z )
	lualine_a = {'mode'},
	lualine_b = {'branch', 'diff', 'diagnostics'},
	lualine_c = {'filename'},
	lualine_x = {'location', 'filesize'},
	lualine_y = {'lsp_status'},
	lualine_z = {'filetype'} -- line:column in file
      },
    },
  },

  -- Shows available keybindings in a popup as you type.
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
	"<leader>?",
	function()
	  require("which-key").show({ global = false })
	end,
	desc = "Buffer Local Keymaps (which-key)",
      },
    },
  }
}
