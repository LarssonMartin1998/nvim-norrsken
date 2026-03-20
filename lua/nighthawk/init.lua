local M = {}

local defaults = {
  integrations = {
    blink                   = true,
    noice                   = true,
    incline                 = true,
    neogit                  = true,
    tiny_inline_diagnostics = true,
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
