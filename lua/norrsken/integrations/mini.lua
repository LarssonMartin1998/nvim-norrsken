local p = require("norrsken.palette")

return function()
    vim.api.nvim_set_hl(0, "MiniDiffSignAdd",       { fg = p.green })
    vim.api.nvim_set_hl(0, "MiniDiffSignChange",    { fg = p.yellow_bright })
    vim.api.nvim_set_hl(0, "MiniDiffSignDelete",    { fg = p.red })
    vim.api.nvim_set_hl(0, "MiniDiffOverAdd",       { fg = p.green,  bg = p.diff_add })
    vim.api.nvim_set_hl(0, "MiniDiffOverChange",    { fg = p.yellow_bright, bg = p.diff_change })
    vim.api.nvim_set_hl(0, "MiniDiffOverDelete",    { fg = p.red,    bg = p.diff_delete })
    vim.api.nvim_set_hl(0, "MiniCursorword",        { bg = p.bg_2 })
    vim.api.nvim_set_hl(0, "MiniCursorwordCurrent", { bg = p.bg_2 })
end
