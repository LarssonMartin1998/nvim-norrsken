local p = require("nighthawk.palette")
local hsl = require("lush").hsl

return function()
  return {
    -- Menu window
    BlinkCmpMenu            { bg = hsl(p.bg_dim),    fg = hsl(p.fg) },
    BlinkCmpMenuBorder      { bg = hsl(p.bg_dim),    fg = hsl(p.bg_3) },
    BlinkCmpMenuSelection   { bg = hsl(p.peach),     fg = hsl(p.bg) },

    -- Scrollbar
    BlinkCmpScrollBarThumb  { bg = hsl(p.yellow) },
    BlinkCmpScrollBarGutter { bg = hsl(p.bg_2) },

    -- Labels
    BlinkCmpLabel           { bg = hsl(p.bg_dim),    fg = hsl(p.fg) },
    BlinkCmpLabelDeprecated { fg = hsl(p.grey_light), gui = "strikethrough" },
    BlinkCmpLabelMatch      { fg = hsl(p.teal),      gui = "bold" },
    BlinkCmpLabelDetail     { fg = hsl(p.grey_light) },
    BlinkCmpLabelDescription { fg = hsl(p.grey_light) },

    -- Ghost text
    BlinkCmpGhostText       { fg = hsl(p.grey_light) },

    -- Documentation popup
    BlinkCmpDoc             { bg = hsl(p.bg_dim),    fg = hsl(p.fg) },
    BlinkCmpDocBorder       { bg = hsl(p.bg_dim),    fg = hsl(p.bg_3) },
    BlinkCmpDocSeparator    { bg = hsl(p.bg_dim),    fg = hsl(p.bg_3) },
    BlinkCmpDocCursorLine   { bg = hsl(p.bg_1) },

    -- Source label
    BlinkCmpSource          { fg = hsl(p.blue_muted) },

    -- Kind icons — semantic colors
    BlinkCmpKind            { fg = hsl(p.fg) },
    BlinkCmpKindText        { fg = hsl(p.fg) },
    BlinkCmpKindMethod      { fg = hsl(p.teal) },
    BlinkCmpKindFunction    { fg = hsl(p.teal) },
    BlinkCmpKindConstructor { fg = hsl(p.teal) },
    BlinkCmpKindField       { fg = hsl(p.fg) },
    BlinkCmpKindVariable    { fg = hsl(p.fg) },
    BlinkCmpKindClass       { fg = hsl(p.blue) },
    BlinkCmpKindInterface   { fg = hsl(p.blue) },
    BlinkCmpKindStruct      { fg = hsl(p.blue) },
    BlinkCmpKindTypeParameter { fg = hsl(p.blue) },
    BlinkCmpKindModule      { fg = hsl(p.blue_muted) },
    BlinkCmpKindProperty    { fg = hsl(p.fg) },
    BlinkCmpKindUnit        { fg = hsl(p.tan) },
    BlinkCmpKindValue       { fg = hsl(p.tan) },
    BlinkCmpKindEnum        { fg = hsl(p.tan) },
    BlinkCmpKindEnumMember  { fg = hsl(p.tan) },
    BlinkCmpKindConstant    { fg = hsl(p.tan) },
    BlinkCmpKindKeyword     { fg = hsl(p.yellow) },
    BlinkCmpKindSnippet     { fg = hsl(p.teal_muted) },
    BlinkCmpKindColor       { fg = hsl(p.peach) },
    BlinkCmpKindFile        { fg = hsl(p.fg) },
    BlinkCmpKindFolder      { fg = hsl(p.fg) },
    BlinkCmpKindReference   { fg = hsl(p.blue_light) },
    BlinkCmpKindEvent       { fg = hsl(p.yellow) },
    BlinkCmpKindOperator    { fg = hsl(p.grey_fg) },
  }
end
