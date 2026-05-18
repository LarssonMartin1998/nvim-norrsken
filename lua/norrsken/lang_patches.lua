local M = {}

-- LSP groups to clear per language. The language suffix (.<lang>) is appended
-- automatically. Clearing lets treesitter's fine-grained captures show through
-- instead of being overridden by overzealous LSP semantic tokens at priority 125.
local lsp_clears = {
  zig = {
    "@lsp.type.keyword",  -- ZLS emits this for all keywords, suppressing conditional/repeat/return distinctions
    "@lsp.type.variable", -- ZLS emits this for types/namespaces/members, suppressing @type/@variable.member/@function.call
  },
}

-- Per-filetype callbacks registered via a single FileType autocmd.
-- Use this for workarounds that must run per-buffer (e.g. matchadd, which is window-local).
local filetype_hooks = {
  cpp = function()
    -- Predicates in ; extends queries are not evaluated in Neovim, so matchadd
    -- at priority 200 is used to recolor 'auto' past treesitter (100) and LSP (125-127).
    vim.fn.matchadd("@keyword", [[\<auto\>]], 200)
  end,
}

function M.apply()
  for lang, groups in pairs(lsp_clears) do
    for _, group in ipairs(groups) do
      vim.api.nvim_set_hl(0, group .. "." .. lang, {})
    end
  end

  local patterns = vim.tbl_keys(filetype_hooks)
  if #patterns > 0 then
    vim.api.nvim_create_autocmd("FileType", {
      pattern = patterns,
      callback = function(ev)
        local hook = filetype_hooks[ev.match]
        if hook then hook() end
      end,
    })
  end
end

return M
