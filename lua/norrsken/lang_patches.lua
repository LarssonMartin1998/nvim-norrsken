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


function M.apply()
  for lang, groups in pairs(lsp_clears) do
    for _, group in ipairs(groups) do
      vim.api.nvim_set_hl(0, group .. "." .. lang, {})
    end
  end

end

return M
