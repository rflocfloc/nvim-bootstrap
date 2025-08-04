# Neovim Dotfiles
Configuration files for setting up neovim.

Clone directory to your `~/.config/nvim`.

## System Dependencies
Required packages:
- `nvim` (0.11+)
- `lua`
- `npm` (for Mason/LSP install)
- `fzf` (for fzf-lua)

## LSP install
LSP must be installed manually. Mason is installed therefore you can check the available ones with ` :Mason `
And install them with ` :MasonInstall <package name> `.

Otherwise remove Mason and install them at user/system level. Once installed LSP should be **enabled** (check lua/plugins/lsp.lua).
