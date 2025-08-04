-- [[ Add Plugin ]]
vim.pack.add({
  { src = "https://github.com/wnkz/monoglow.nvim.git", priority = 1000},
})

-- [[ Enable colorscheme ]]
vim.o.background = 'dark'
vim.cmd.colorscheme 'monoglow'
