return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    -- Icons mini.icons, need for statusline and which-key.
    require('mini.icons').setup {}

    -- Show notifications require('mini.notify').setup {}

    -- Extend and create a/i textobjects.
    require('mini.ai').setup { n_lines = 500 }

    -- Minimal and fast autopairs
    require('mini.pairs').setup {}

    -- Move any selection in any direction, with = adjust indent.
    require('mini.move').setup {
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
	line_up = "<A-k>"
      }
    }

    -- Split and join arguments using gS
    require('mini.splitjoin').setup {
      mappings = {toggle = 'gS', split = '', join = '',}
    }

    -- Visualize and work with indent scope
    require('mini.indentscope').setup {
      options = { try_as_border = true },
      symbol = "│",
    }

  end
}
