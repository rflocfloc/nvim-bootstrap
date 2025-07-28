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
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      delay = 0, -- delay between pressing a key and opening which-key (milliseconds), independent of vim.o.timeoutlen
      preset = 'helix', -- Three layouts available: classic, modern, helix
      plugins = {marks = false, register = false},
      icons = {
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
      spec = {
        { '<leader>s', group = '[S]earch', icon = '󰱼'},
        { '<leader>g', group = 'LSP: [G]oto' },
        { '<leader>a', group = 'H[a]rpoon', icon = '󱡀' },
        { '<leader>w', group = '[W]indow' , icon = ''},
        { '<leader>t', group = '[T]odo', icon = '' },
        { '<leader>H', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
  },
 
}
