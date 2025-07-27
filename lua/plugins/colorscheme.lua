return {
  { -- tokyonight
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000, -- Make sure to load this before all the other start plugins
    opts = {
	    comments = {italic = false},
	    style = "moon"
    }
  },
  { -- gruvbox
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    priority = 1000, -- Make sure to load this before all the other start plugins
    opts = {
	    comments = {italic = false},
	    style = "dark"
    }
  },
  { -- rosepine
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000, -- Make sure to load this before all the other start plugins.
    opts = {
	    comments = {italic = false},
    }
  },
}
