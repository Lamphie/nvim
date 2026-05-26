# Neovim Configuration

This repository contains my personal configuration for Neovim.

The configuration is based on the setup [Kickstart](https://github.com/nvim-lua/kickstart.nvim), repository [Sin-cy](https://github.com/Sin-cy/nvim-scratch) and Sin-cy [video](https://www.youtube.com/watch?v=XQuNoprFW38).

To ease maintenance and readability, the plugin configuration has been cut into multiple files. Thanks to the vim.pack, all plugin files are automatically loaded when put in the plugin folder.

The aim of this repository is to provide a minimalist configuration for Neovim that works out-of-the-box.

## Current version compatibility

Neovim 0.12.2

This repository will be updated for any Neovim new version.

The current plugin manage is vim.pack release with 0.12. In case you want to use lazy, use the [pre0.12 release](https://github.com/Lamphie/nvim/releases/tag/pre0.12)

## Features

- [blink](https://github.com/Saghen/blink.nvim)
- [conform](https://github.com/stevearc/conform.nvim)
- [nordic](https://github.com/alexvzyl/nordic.nvim)
- [lualine](https://github.com/nvim-lualine/lualine.nvim)
- [nvim-lint](https://github.com/mfussenegger/nvim-lint)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [telescope](https://github.com/nvim-telescope/telescope.nvim)
- [which-key](https://github.com/folke/which-key.nvim)

## Installation

To set up the Neovim configuration on your system, you can follow the instructions below.

### Manual Installation

1. Install Neovim and the external dependencies:

   You will the following packages:
   - neovim
   - git
   - unzip
   - npm
   - ripgrep
   - terraform or opentofu (both optional)

   Both `unzip` and `npm` are mainly needed by Mason to install the LSP.
   For terraform/opentofu, it will be use by [conform](https://github.com/Lamphie/nvim/blob/fe20f38028f8f53a273da3efd1a3ad1c176133fc/plugin/conform.lua#L50) to autoformat tf file.

   Use your distribution package manager. In my case, I will be using pacman.

   ```bash
   sudo pacman -S neovim git unzip npm ripgrep
   ```

2. Make a backup of your current Neovim configuration:

   ```bash
   cp -r ~/.config/nvim/ ~/.config/nvim_backup
   ```

3. Clone this repository to your local machine:

   ```bash
   git clone git@github.com:Lamphie/nvim.git ~/.config/nvim
   ```

## Configuration

### First use and periodic maintenance

The Neovim configuration use vim.pack and Mason to ease the maintenance.
You will need to call `:lua vim.pack.update() ` and `:Mason` from time to time to update plugin and LSP.

### Save your Neovim configuration

Put your Neovim configuration into a remote git repository like gitlab.com or github.com. Never try to install a plugin or LSP manually with `vim.pack` or `Mason`.

Instead, make the change in the configuration file. That will tell `vim.pack` and `Mason` to install the wanted plugin/LSP.

### Custom Ansible Lint Configuration

A custom Ansible lint configuration can be utilized. You can place the Ansible lint configuration file at the following location: [nvim-lspconfig.lua](https://github.com/Lamphie/nvim/blob/fe20f38028f8f53a273da3efd1a3ad1c176133fc/plugin/lsp.lua#L138).

For more details on configuring Ansible Lint, you can refer to the official documentation [here](https://ansible.readthedocs.io/projects/lint/configuring/).

### Adding a new feature/plugin

Any new plugin file added in the `~/.config/nvim/plugin` will be loaded automatically [plugin folder](https://github.com/Lamphie/nvim/tree/main/plugin).
If you want to add a plugin, just copy an easy plugin file like [nordic](https://github.com/Lamphie/nvim/blob/main/plugin/nordic.lua) and adjust to your new plugin.

### Adding and debugging a LSP

To add a LSP, do not install it manually with `Mason`. Instead, add the needed LSP [here](https://github.com/Lamphie/nvim/blob/b251fa71a186e631dc9fa2bfd7c75191678ef5f1/lua/plugins/nvim-lspconfig.lua#L215).
`Mason` will install the LSP for you and `mason-lspconfig` will make it usable.

To debug a LSP installation, you can look at the error with `:Mason` but read the log file with `:MasonLog` or at `~/.local/state/nvim/mason.log`.

To debug a LSP, you just need to open a file with the right extension/filetype and then call `:checkhealth lsp` to see it the LSP is correctly loaded.

## Troubleshooting

### Cache issue, weird behavior
In case of cache issue, delete these folders
```bash
rm -rf .local/share/nvim
```

```bash
rm -rf ~/.config/nvim
```

And then restart your neovim.
