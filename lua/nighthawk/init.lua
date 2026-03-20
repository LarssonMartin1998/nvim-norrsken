local M = {}

local defaults = {
  integrations = {
    blink                   = false,
    noice                   = false,
    incline                 = false,
    neogit                  = false,
    tiny_inline_diagnostics = false,
  },
}

local config = vim.deepcopy(defaults)

function M.setup(opts)
  config = vim.tbl_deep_extend("force", defaults, opts or {})
end

function M.get_config()
  return config
end

return M
