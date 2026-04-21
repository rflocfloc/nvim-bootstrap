-- ~/.config/nvim/init.lua

-- -----------------------------------------
-- [[ OPTIONS ]]

-- Set leader key to <Space>
vim.g.mapleader =  " "

-- show line numbers and relative numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- set default indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- use spaces when inserting tabs
vim.opt.expandtab = true

-- show whitespaces
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '·' }

-- incremental command preview
vim.opt.inccommand = 'split'

-- ask confirm when leaving unsaved files
vim.opt.confirm = true

-- open windows right/low
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Case insensitive searching UNLESS /C or the search has capitals.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Save undo history
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- visual settings
vim.opt.termguicolors = true

-- keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- update times and timeouts (for performance)
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 10

-- -----------------------------------------
-- [[ AUTOCOMMANDS ]]

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup("User/HighlightText", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- -----------------------------------------
-- [[ KEYMAPS ]]

-- powerful Esc
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = "<Esc> to clear search highlights" })
vim.keymap.set('t', '<Esc>', '<C-\\><C-N>', { desc = "<Esc> to exit terminal mode" })

-- indent while remaining in visual mode
vim.keymap.set('x', '<', '<gv', { noremap = true, silent = true, desc = 'Move block selection left' })
vim.keymap.set('x', '>', '>gv', { noremap = true, silent = true, desc = 'Move block selection right' })

-- copy/paste and delete system integration
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete to blackhole" })
vim.keymap.set("v", "<leader>p", [["_dP]], { desc = "Delete to blackhole and Paste" })

-- quick global file replace
vim.keymap.set("v", "<leader>r", [["hy:%s/<C-r>h//g<left><left>]], { desc = "Replace selection globally" })
