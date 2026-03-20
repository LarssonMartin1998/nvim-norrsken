local p = require("nighthawk.palette")
local hsl = require("lush").hsl

return function()
  return {
    -- Status window
    NeogitNormal            { bg = hsl(p.bg),       fg = hsl(p.fg) },
    NeogitCursorLine        { bg = hsl(p.bg_1) },

    -- Section headers (Untracked, Unstaged, Staged...)
    NeogitSectionHeader     { fg = hsl(p.yellow),   gui = "bold" },
    NeogitFold              { fg = hsl(p.yellow) },

    -- Branch / remote / tag
    NeogitBranch            { fg = hsl(p.teal) },
    NeogitBranchHead        { fg = hsl(p.teal),     gui = "bold" },
    NeogitRemote            { fg = hsl(p.blue_muted) },
    NeogitTagName           { fg = hsl(p.yellow) },

    -- File paths
    NeogitFilePath          { fg = hsl(p.fg) },
    NeogitFilePathModified  { fg = hsl(p.yellow) },

    -- Change types in status
    NeogitChangeAdded       { fg = hsl(p.teal_muted) },
    NeogitChangeDeleted     { fg = hsl(p.red) },
    NeogitChangeModified    { fg = hsl(p.yellow) },
    NeogitChangeNewFile     { fg = hsl(p.teal_muted) },
    NeogitChangeRenamed     { fg = hsl(p.blue) },
    NeogitChangeUnmerged    { fg = hsl(p.red) },
    NeogitChangeCopied      { fg = hsl(p.teal_muted) },
    NeogitChangeUpdated     { fg = hsl(p.yellow) },

    -- Diff view
    NeogitHunkHeader            { bg = hsl(p.bg_2),        fg = hsl(p.grey_fg) },
    NeogitHunkHeaderHighlight   { bg = hsl(p.bg_3),        fg = hsl(p.fg),     gui = "bold" },
    NeogitDiffContext           { bg = hsl(p.bg) },
    NeogitDiffContextHighlight  { bg = hsl(p.bg_1) },
    NeogitDiffAdd               { bg = hsl(p.diff_add),    fg = hsl(p.teal) },
    NeogitDiffAddHighlight      { bg = hsl(p.diff_add),    fg = hsl(p.teal),       gui = "bold" },
    NeogitDiffDelete            { bg = hsl(p.diff_delete), fg = hsl(p.grey_fg) },
    NeogitDiffDeleteHighlight   { bg = hsl(p.diff_delete), fg = hsl(p.grey_fg),    gui = "bold" },

    -- Commit message
    NeogitCommitMessage         { fg = hsl(p.fg) },
    NeogitCommitMessageSummary  { fg = hsl(p.fg),      gui = "bold" },

    -- Graph
    NeogitGraphBlue             { fg = hsl(p.blue) },
    NeogitGraphBoldBlue         { fg = hsl(p.blue),    gui = "bold" },
    NeogitGraphGreen            { fg = hsl(p.teal_muted) },
    NeogitGraphBoldGreen        { fg = hsl(p.teal_muted), gui = "bold" },
    NeogitGraphRed              { fg = hsl(p.red) },
    NeogitGraphBoldRed          { fg = hsl(p.red),     gui = "bold" },
    NeogitGraphYellow           { fg = hsl(p.yellow) },
    NeogitGraphBoldYellow       { fg = hsl(p.yellow),  gui = "bold" },
    NeogitGraphCyan             { fg = hsl(p.teal) },
    NeogitGraphBoldCyan         { fg = hsl(p.teal),    gui = "bold" },
    NeogitGraphWhite            { fg = hsl(p.fg) },
    NeogitGraphBoldWhite        { fg = hsl(p.fg),      gui = "bold" },
    NeogitGraphGray             { fg = hsl(p.grey_fg) },
  }
end
