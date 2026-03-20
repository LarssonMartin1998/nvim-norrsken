local p = require("nighthawk.palette")
local hsl = require("lush").hsl

return function()
  return {
    -- Cmdline popup
    NoiceCmdline            { bg = hsl(p.bg_dim),  fg = hsl(p.fg) },
    NoiceCmdlinePopup       { bg = hsl(p.bg_dim),  fg = hsl(p.fg) },
    NoiceCmdlinePopupBorder { bg = hsl(p.bg_dim),  fg = hsl(p.bg_3) },
    NoiceCmdlinePopupTitle  { bg = hsl(p.bg_dim),  fg = hsl(p.yellow) },
    NoiceCmdlineIcon        { fg = hsl(p.yellow) },

    -- Generic popups
    NoicePopup              { bg = hsl(p.bg_dim),  fg = hsl(p.fg) },
    NoicePopupBorder        { bg = hsl(p.bg_dim),  fg = hsl(p.bg_3) },

    -- Confirm dialog
    NoiceConfirm            { bg = hsl(p.bg_dim),  fg = hsl(p.fg) },
    NoiceConfirmBorder      { bg = hsl(p.bg_dim),  fg = hsl(p.bg_3) },

    -- Mini inline messages
    NoiceMini               { bg = hsl(p.bg_2),    fg = hsl(p.fg) },

    -- LSP progress
    NoiceLspProgressTitle   { fg = hsl(p.yellow) },
    NoiceLspProgressClient  { fg = hsl(p.blue_muted) },
    NoiceLspProgressSpinner { fg = hsl(p.teal) },

    -- Progress bar
    NoiceFormatProgressDone { fg = hsl(p.teal),    gui = "bold" },
    NoiceFormatProgressTodo { fg = hsl(p.grey_light) },

    -- Log levels
    NoiceFormatLevelDebug   { fg = hsl(p.grey_light) },
    NoiceFormatLevelInfo    { fg = hsl(p.blue_light) },
    NoiceFormatLevelWarn    { fg = hsl(p.yellow) },
    NoiceFormatLevelError   { fg = hsl(p.red) },
  }
end
