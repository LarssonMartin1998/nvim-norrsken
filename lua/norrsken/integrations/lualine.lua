local p = require("norrsken.palette")

return {
  normal = {
    a = { fg = p.bg, bg = p.teal,   gui = "bold" },
    b = { fg = p.fg, bg = p.bg_1 },
    c = { fg = p.fg, bg = p.bg_dim },
  },
  insert = {
    a = { fg = p.bg, bg = p.yellow, gui = "bold" },
    b = { fg = p.fg, bg = p.bg_1 },
    c = { fg = p.fg, bg = p.bg_dim },
  },
  visual = {
    a = { fg = p.bg, bg = p.cyan,   gui = "bold" },
    b = { fg = p.fg, bg = p.bg_1 },
    c = { fg = p.fg, bg = p.bg_dim },
  },
  replace = {
    a = { fg = p.bg, bg = p.red,    gui = "bold" },
    b = { fg = p.fg, bg = p.bg_1 },
    c = { fg = p.fg, bg = p.bg_dim },
  },
  command = {
    a = { fg = p.bg, bg = p.orange, gui = "bold" },
    b = { fg = p.fg, bg = p.bg_1 },
    c = { fg = p.fg, bg = p.bg_dim },
  },
  inactive = {
    a = { fg = p.grey_light, bg = p.bg_dim },
    b = { fg = p.grey_light, bg = p.bg_dim },
    c = { fg = p.grey_light, bg = p.bg_dim },
  },
}
