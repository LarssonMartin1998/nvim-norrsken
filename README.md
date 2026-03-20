# falcon.nvim

Personal Neovim colorscheme built with [lush.nvim](https://github.com/rktjmp/lush.nvim). Inspired by the NvChad falcon theme but diverges significantly.

## Install

```lua
{ dir = "/path/to/falcon.nvim", dependencies = { "rktjmp/lush.nvim" } }
```

```lua
vim.cmd.colorscheme("falcon")
```

## Lualine

```lua
require("lualine").setup({ options = { theme = require("falcon.theme").lualine } })
```
