vim.opt.background = "dark"

local lush = require("lush")

lush(require("nighthawk.theme"))
lush(require("nighthawk.integrations.blink"))
lush(require("nighthawk.integrations.noice"))
lush(require("nighthawk.integrations.incline"))
lush(require("nighthawk.integrations.neogit"))
lush(require("nighthawk.integrations.tiny-inline-diagnostics"))
