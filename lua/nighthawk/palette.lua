local M = {}

-- Backgrounds
M.bg      = "#020222"
M.bg_dark = "#0c0c2d"
M.bg_dim  = "#0b0b2b"
M.bg_1    = "#161636"
M.bg_2    = "#202040"
M.bg_3    = "#2a2a4a"

-- Foregrounds
M.fg = "#eeeef5"

-- Greys
M.grey_dark  = "#393959"
M.grey_light = "#5c5c7c"
M.grey_fg    = "#B4B4B9"

-- Amber — keywords, declarations, language structure
M.yellow = "#D4973E"

-- Orange — search highlights
M.orange = "#FF761A"
M.peach  = "#FFB07B"

-- Teal — execution flow (functions, return, control flow)
M.teal       = "#34BFA4"
M.teal_muted = "#9BCCBF"

-- Cyan — UI only (lualine)
M.cyan = "#39c5cf"

-- Blue — types, namespaces
M.blue       = "#7ab4f5"
M.blue_muted = "#607a94"
M.blue_light = "#BFDAFF"

-- Purple — legacy fallback
M.purple = "#99A4BC"

-- Tan — values (strings, numbers, booleans, constants)
M.tan = "#CFC1B2"

-- Diagnostics
M.red = "#ff5555"

return M
