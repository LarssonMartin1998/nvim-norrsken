local p = require("norrsken.palette")
local hsl = require("lush").hsl

return function()
  return {
    TinyInlineDiagnosticVirtualTextError  { fg = hsl(p.red),        bg = hsl(p.diff_delete) },
    TinyInlineDiagnosticVirtualTextWarn   { fg = hsl(p.yellow),     bg = hsl(p.diff_change) },
    TinyInlineDiagnosticVirtualTextInfo   { fg = hsl(p.blue_light), bg = hsl(p.bg_1) },
    TinyInlineDiagnosticVirtualTextHint   { fg = hsl(p.teal_muted), bg = hsl(p.bg_1) },
    TinyInlineDiagnosticVirtualTextOk     { fg = hsl(p.teal),       bg = hsl(p.diff_add) },
    TinyInlineDiagnosticVirtualTextArrow  { fg = hsl(p.grey_dark) },
  }
end
