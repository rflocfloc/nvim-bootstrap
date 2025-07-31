return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    -- Icons mini.icons, need for statusline and which-key.
    require('mini.icons').setup {}

    -- Split and join arguments using gS
    require('mini.splitjoin').setup {
      mappings = {toggle = 'gS', split = '', join = '',}
    }

    -- Visualize and work with indent scope
    require('mini.indentscope').setup {
      options = { try_as_border = true },
      symbol = "│", }

  end
}
