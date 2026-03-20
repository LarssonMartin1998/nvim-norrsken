# nighthawk.nvim

A dark Neovim colorscheme built with [lush.nvim](https://github.com/rktjmp/lush.nvim).

The color palette is built around a deep navy-black background with a deliberate semantic system — each color maps to a category of meaning rather than being decorative. Keywords are warm amber, execution flow is teal, types are blue, values are tan. The goal is low visual noise with high information density.

## Install

```lua
{ "LarssonMartin1998/nighthawk.nvim" }
```

```lua
vim.cmd.colorscheme("nighthawk")
```

## Setup

All integrations are enabled by default. Disable any you don't need:

```lua
require("nighthawk").setup({
  integrations = {
    blink                   = true,
    noice                   = true,
    incline                 = true,
    neogit                  = true,
    tiny_inline_diagnostics = true,
  },
})
```

`setup()` must be called before the colorscheme is applied.

## Lualine

The lualine theme is not auto-applied. Pass it explicitly in your lualine setup:

```lua
require("lualine").setup({ options = { theme = require("nighthawk.integrations.lualine") } })
```
