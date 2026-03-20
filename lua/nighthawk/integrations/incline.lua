local p = require("nighthawk.palette")
local hsl = require("lush").hsl

return function()
  return {
    InclineNormal   { bg = hsl(p.bg_2), fg = hsl(p.fg) },
    InclineNormalNC { bg = hsl(p.bg_1), fg = hsl(p.grey_fg) },
  }
end
