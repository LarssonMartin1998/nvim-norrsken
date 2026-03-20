# nighthawk.nvim

A dark Neovim colorscheme built with [lush.nvim](https://github.com/rktjmp/lush.nvim).

The color palette is built around a deep navy-black background with a deliberate semantic system — each color maps to a category of meaning rather than being decorative. Keywords are warm amber, execution flow is teal, types are blue, values are tan. The goal is low visual noise with high information density.

## Install

```lua
{ "LarssonMartin1998/nighthawk.nvim", dependencies = { "rktjmp/lush.nvim" } }
```

```lua
vim.cmd.colorscheme("nighthawk")
```

## Lualine

```lua
require("lualine").setup({ options = { theme = require("nighthawk.integrations.lualine") } })
```
