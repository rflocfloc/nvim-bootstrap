-- ~/.config/nvim/init.lua
-- Resonable one file config for nvim

-- -------------
-- [[ OPTIONS ]]
-- -------------

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8
vim.opt.inccommand = 'split'
vim.opt.confirm = true

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.breakindent = true

-- Search settings
vim.opt.smartcase = true
vim.opt.path:append("**")

-- Visual settings
vim.opt.termguicolors = true
vim.opt.guicursor = ""
vim.opt.signcolumn = "yes"
vim.opt.complete.opt = {"menuone","noinsert","noselect"}
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- File handling
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
  return vim.api.nvim_create_augroup("UserConfig_" .. name, { clear = true })
end

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = augroup('HighlightText'),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  desc = 'Resize splits if window is resized',
  group = augroup("ResizeSplits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- Checks and reloads file when modified by another program/session
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  desc = 'Check if reload is needed when changing file',
  group = augroup("CheckFile"),
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

-- Closes unused terminals
vim.api.nvim_create_autocmd("TermClose", {
  group = augroup("CloseTerminal"),
  callback = function()
    if vim.v.event.status == 0 then
      vim.api.nvim_buf_delete(0, {})
    end
  end,
})

-- -------------
-- [[ KEYMAPS ]]
-- -------------

-- Setting leader key
vim.g.mapleader =  " "
vim.g.maplocalleader = " "

-- Clear highlights on search pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit terminal mode pressing <Esc>
vim.keymap.set('t', '<Esc>', '<C-\\><C-N>')

--  Center curson when scrolling/searching
vim.keymap.set('n', '<C-d>', '<C-d>zz', {desc = 'Scroll down, centered'})
vim.keymap.set('n', '<C-u>', '<C-u>zz', {desc = 'Scroll up, centered'})
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result, centered' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Prev search result, centered' })

--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', {noremap = true, desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', {noremap = true, desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', {noremap = true, desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', {noremap = true, desc = 'Move focus to the upper window' })

-- Move between buffers keymaps
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next Buffer" })

--  Use Alt+<hjkl> to move lines 
-- (Normal mode)
vim.keymap.set('n', '<A-h>', '<<', { noremap = true, silent = true, desc = 'Move line to the left' })
vim.keymap.set('n', '<A-l>', '>>', { noremap = true, silent = true, desc = 'Move line to the right' })
vim.keymap.set('n', '<A-j>', ':m +1<CR>==', { noremap = true, silent = true, desc = 'Move line down' })
vim.keymap.set('n', '<A-k>', ':m -2<CR>==', { noremap = true, silent = true, desc = 'Move line up' })
-- (Visual and Block mode)
vim.keymap.set({'v', 'x'}, '<A-h>', '<gv', { noremap = true, silent = true, desc = 'Move block selection to the left' })
vim.keymap.set({'v', 'x'}, '<A-l>', '>gv', { noremap = true, silent = true, desc = 'Move block selection to the right' })
vim.keymap.set({'v', 'x'}, '<A-j>', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true, desc = 'Move block selection down' })
vim.keymap.set({'v', 'x'}, '<A-k>', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true, desc = 'Move block selection up' })

-- Delete to blackhole registry (without yank)
vim.keymap.set({'v', 'n'}, '<leader>d', "\"_d", { noremap = true, silent = true, desc = 'Delete to blackhole' })
vim.keymap.set({'v', 'n'}, '<leader>p', [["_dP]], { noremap = true, silent = true, desc = 'Delete to blackhole and Paste' })

-- Yank to system clipboard
vim.keymap.set('x', '<leader>y', [["+y]], { noremap = true, silent = true, desc = 'Yank to system clipboard' })

-- Replace selection in file
vim.keymap.set('v', '<leader>r', "\"hy:%s/<C-r>h//g<left><left>", { noremap = true, silent = true, desc = 'Replace selection globally' })

-- [[ Netrw ]]
vim.keymap.set('n', '<leader>e', ':Ex<CR>', { noremap = true, silent = true, desc = 'Open [E]xplorer'})
