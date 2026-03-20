vim.opt.background = "dark"

local lush = require("lush")
local integrations = require("norrsken").get_config().integrations

lush(require("norrsken.theme"))

if integrations.blink                   then lush(require("norrsken.integrations.blink"))                   end
if integrations.noice                   then lush(require("norrsken.integrations.noice"))                   end
if integrations.incline                 then lush(require("norrsken.integrations.incline"))                 end
if integrations.neogit                  then lush(require("norrsken.integrations.neogit"))                  end
if integrations.tiny_inline_diagnostics then lush(require("norrsken.integrations.tiny-inline-diagnostics")) end

local p = require("norrsken.palette")
vim.g.terminal_color_0  = p.bg
vim.g.terminal_color_1  = p.red
vim.g.terminal_color_2  = p.teal_muted
vim.g.terminal_color_3  = p.yellow
vim.g.terminal_color_4  = p.blue
vim.g.terminal_color_5  = p.purple
vim.g.terminal_color_6  = p.teal
vim.g.terminal_color_7  = p.grey_fg
vim.g.terminal_color_8  = p.grey_dark
vim.g.terminal_color_9  = p.red
vim.g.terminal_color_10 = p.teal
vim.g.terminal_color_11 = p.yellow
vim.g.terminal_color_12 = p.blue_light
vim.g.terminal_color_13 = p.purple
vim.g.terminal_color_14 = p.cyan
vim.g.terminal_color_15 = p.fg
