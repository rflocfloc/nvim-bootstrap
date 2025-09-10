-- ~/.config/nvim/init.lua

-- -------------
-- [[ OPTIONS ]]
-- -------------

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
vim.g.netrw_liststyle = 3
vim.g.netrw_showhidden = 1
vim.g.netrw_winsize = 20

-- ------------------
-- [[ AUTOCOMMANDS ]]
-- ------------------

-- set local function
local function augroup(name)
  return vim.api.nvim_create_augroup("User_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = augroup('HighlightText'),
  callback = function()
    vim.hl.on_yank()
  end,
})


-- -------------
-- [[ KEYMAPS ]]
-- -------------

vim.g.mapleader =  " "
vim.g.maplocalleader = " "

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', {desc = "<Esc> to clear search highlights"})
vim.keymap.set('t', '<Esc>', '<C-\\><C-N>', {desc = "<Esc> to exit terminal mode"})

vim.keymap.set({'v', 'x'}, '<S-h>', '<gv', { noremap = true, silent = true, desc = 'Move selection to the left' })
vim.keymap.set({'v', 'x'}, '<S-l>', '>gv', { noremap = true, silent = true, desc = 'Move selection to the right' })
vim.keymap.set({'v', 'x'}, '<S-j>', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true, desc = 'Move block selection down' })
vim.keymap.set({'v', 'x'}, '<S-k>', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true, desc = 'Move block selection up' })

vim.keymap.set({'v', 'n'}, '<leader>d', "\"_d", { noremap = true, silent = true, desc = 'Delete to blackhole' })
vim.keymap.set({'v', 'n'}, '<leader>p', [["_dP]], { noremap = true, silent = true, desc = 'Delete to blackhole and Paste' })

vim.keymap.set('x', '<leader>y', [["+y]], { noremap = true, silent = true, desc = 'Yank to system clipboard' })

vim.keymap.set('v', '<leader>r', "\"hy:%s/<C-r>h//g<left><left>", { noremap = true, silent = true, desc = 'Replace selection globally' })
