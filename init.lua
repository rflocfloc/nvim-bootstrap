-- ~/.config/nvim/init.lua

-- -------------
-- [[ OPTIONS ]]
-- -------------

-- Set leader key
-- very useful for custom keymaps (eg. '<leader>X')
vim.g.mapleader =  " "

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.inccommand = 'split'
vim.opt.confirm = true

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Search settings
vim.opt.smartcase = true

-- Loclist default location
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Visual settings
vim.opt.termguicolors = true
vim.opt.guicursor = ""
vim.opt.signcolumn = "yes"
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- File handling/history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500

-- File Brower settings (Netrw)
-- vim.g.netrw_banner = 0	-- Uncomment to remove Netrw banner
-- vim.g.netrw_liststyle = 3  -- Uncomment to have tree style :Explore
vim.g.netrw_showhidden = 1
vim.g.netrw_winsize = 20

-- ------------------
-- [[ AUTOCOMMANDS ]]
-- ------------------
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup("User_HighlightText", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- -------------
-- [[ KEYMAPS ]]
-- -------------
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', {desc = "<Esc> to clear search highlights"})
vim.keymap.set('t', '<Esc>', '<C-\\><C-N>', {desc = "<Esc> to exit terminal mode"})

vim.keymap.set({'v', 'x'}, '<S-h>', '<gv', { noremap = true, silent = true, desc = 'Move selection to the left' })
vim.keymap.set({'v', 'x'}, '<S-l>', '>gv', { noremap = true, silent = true, desc = 'Move selection to the right' })
vim.keymap.set({'v', 'x'}, '<S-j>', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true, desc = 'Move block selection down' })
vim.keymap.set({'v', 'x'}, '<S-k>', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true, desc = 'Move block selection up' })

-- Very useful default keymaps:
-- - "\d", desc = 'Delete to blackhole'
-- - "\p", desc = 'Delete to blackhole and Paste'
-- - "\y", desc = 'Yank to system clipboard'
-- - "\r", desc = 'Replace selection globally'
