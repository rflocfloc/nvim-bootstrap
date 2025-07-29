return {
  -- Icons mini.icons, need for statusline and which-key.
  { 'echasnovski/mini.icons', version = '*' },

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
  { 'echasnovski/mini.splitjoin', 
    version = '*', 
    opts = {
      mappings = {
	toggle = 'gS',
	split = '',
	join = '',
      }, 
    } 
  },

  -- Visualize and work with indent scope
  { 'echasnovski/mini.indentscope', 
    version = '*',
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts = {
      options = { try_as_border = true },
      symbol = "│",
    },
  },
}
