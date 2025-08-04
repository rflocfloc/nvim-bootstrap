-- [[ Add Plugin ]]
vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig.git"},
  { src = "https://github.com/mason-org/mason.nvim.git"},
})


-- [[ Plugin Setup ]]
require("mason").setup({
  ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

-- [[ Enable LSP ]]
vim.lsp.enable "lua_ls"
vim.lsp.enable "bash_ls"
vim.lsp.enable "pyright"
vim.lsp.enable "ansiblels"
