return {
  { -- Icons mini.icons
    'echasnovski/mini.icons', 
    version = '*' 
  },

  { -- Status bar
    'nvim-lualine/lualine.nvim',
    opts = {
      icons_enabled = true,
      theme = 'auto',
      sections = { -- sections of the status bar from left to right ( A | B | C ------------ X | Y | Z )
	lualine_a = {'mode'},
	lualine_b = {'branch', 'diff', 'diagnostics'},
	lualine_c = {'filename'},
	lualine_x = {'filetype', 'filesize'},
	lualine_y = {'lsp_status'},
	lualine_z = {'location'} -- line:column in file
      },
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  { -- Snacks ui components
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      dashboard = {
        -- Startup dashboard
        enabled = true,
        sections = {
          { section = "header" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup" },
        },
      },
      picker = {
        -- picker default behaviour
        enabled = true,
        layout = "telescope"
      },
      bigfile = {
        -- Files too big are not rendered by picker preview and better displayed
        enabled = true
      },
      quickfile = {
        -- When doing nvim somefile.txt, it will render the file as quickly as possible, before loading your plugins
        enabled = true
      },
    }
  }
}
