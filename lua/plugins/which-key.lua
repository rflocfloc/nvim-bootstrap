return {
'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      delay = 0, -- delay between pressing a key and opening which-key (milliseconds), independent of vim.o.timeoutlen
      preset = 'helix', -- Three layouts available: classic, modern, helix
      plugins = {
	marks = false, 
	registers = false,
	spelling = false,
	presets = {
                operators = false,
                motions = false,
                text_objects = false,
                windows = true,
                nav = true,
                z = true,
                g = true,
            },
      },
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
        { '<leader>s', group = 'Search', icon={icon = '󰱼', color = "orange"}},
        { '<leader>f', group = 'Flash', icon={icon = '', color = "yellow"}},
        { '<leader>a', group = 'Harpoon', icon={icon = '󱡀', color='green'} },
        { '<C-w>', group = 'Window' , icon = ''},
        { '<leader>T', group = 'Todo', icon = {icon = "", color = "cyan"}},
        { '<leader>t', group = 'Floating Terminal', icon = {icon = "", color = "red"}},
        { '<leader><leader>', group = 'Existing Buffers', icon = {icon = "", color = "orange"}},
        { '<leader>H', group = 'Git Hunk', mode = { 'n', 'v' } },
      },
    },
}
