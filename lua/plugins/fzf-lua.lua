-- [[ Add Plugin ]]
vim.pack.add({
  { src = "https://github.com/ibhagwan/fzf-lua.git"}, 
  { src = "https://github.com/echasnovski/mini.icons.git"}
})


-- [[ Plugin Setup ]]
require("fzf-lua").setup({
  defaults = {file_icons = "mini"},
  files = {cwd_prompt = false},
  previewers = {
    builtin = {
      syntax_limit_b = 1024 * 100, -- 100KB
    },
  },
  grep = {
    rg_glob = true, -- enable glob parsing
    glob_flag = "--iglob", -- case insensitive globs
    glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
  },
})


-- [[ Keymaps ]]
vim.keymap.set({'v', 'n'}, '<leader>sf', '<cmd>FzfLua files<CR>', {desc = '[S]earch [F]iles' })
vim.keymap.set({'v', 'n'}, '<leader>sb', '<cmd>FzfLua buffers<CR>', {desc = '[S]earch [B]uffers' })
vim.keymap.set({'v', 'n'}, '<leader>sg', '<cmd>FzfLua grep<CR>', {desc = '[S]earch [G]rep' })
vim.keymap.set({'v', 'n'}, '<leader>sw', '<cmd>FzfLua grep_cword<CR>', {desc = '[S]earch current [W]ord' })
