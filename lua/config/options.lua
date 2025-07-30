vim.opt.number = true 		-- Enable line numbers
vim.opt.relativenumber = true 	-- Enable line relative numbers
vim.o.mouse = 'a'		-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.showmode = false		-- Don't show the mode, since it's already in the status line
vim.o.breakindent = true	-- Enable break indent
vim.o.undofile = true		-- Save undo history
vim.o.ignorecase = true		-- Case-insensitive searching *
vim.o.smartcase = true		-- * UNLESS \C or one or more capital letters in the search term
vim.o.signcolumn = 'yes'	-- Keep signcolumn on by default
vim.o.updatetime = 250		-- Decrease update time
vim.o.timeoutlen = 300		-- Decrease mapped sequence wait time
vim.o.inccommand = 'split'	-- Preview substitutions live, as you type!
vim.o.cursorline = true		-- Show which line your cursor is on
vim.o.scrolloff = 10		-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.tabstop = 8 		-- Tab indent: Always 8 (see :h tabstop)
vim.opt.softtabstop = 2 	-- Tab indent: size of tab
vim.opt.shiftwidth = 2 		-- Tab indent: size of tab
vim.opt.expandtab = true 	-- Converts tab in spaces
vim.opt.termguicolors = true	-- 24-bit colored for notify

-- Configure how new splits should be opened
vim.o.splitright = true	
vim.o.splitbelow = true

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Sets how neovim will display certain whitespace characters in the editor.
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
vim.o.confirm = true
