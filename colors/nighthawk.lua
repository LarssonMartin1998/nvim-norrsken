vim.opt.background = "dark"

local lush = require("lush")
local integrations = require("nighthawk").get_config().integrations

lush(require("nighthawk.theme"))

if integrations.blink                   then lush(require("nighthawk.integrations.blink"))                   end
if integrations.noice                   then lush(require("nighthawk.integrations.noice"))                   end
if integrations.incline                 then lush(require("nighthawk.integrations.incline"))                 end
if integrations.neogit                  then lush(require("nighthawk.integrations.neogit"))                  end
if integrations.tiny_inline_diagnostics then lush(require("nighthawk.integrations.tiny-inline-diagnostics")) end
