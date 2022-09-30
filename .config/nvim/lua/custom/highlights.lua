local M = {
  override = {
    NvimTreeCursorLine = {
      foreground = "orange",
    },
  },
  add = {
    DiagnosticWarn = {
      foreground = "red",
    },
    DiagnosticUnderlineError = {
      sp = "red",
      undercurl = true
    },
    DiagnosticUnderlineWarn = {
      sp = "orange",
      undercurl = true
    },
    DiagnosticUnderlineInfo = {
      sp = "white",
      undercurl = true
    },
    DiagnosticUnderlineHint = {
      sp = "orange",
      undercurl = true
    },
    Spellbad = {
      sp = "red",
      undercurl = true
    },
    SpellCap = {
      sp = "orange",
      undercurl = true
    },
    SpellLocal = {
      sp = "orange",
      undercurl = true
    },
    SpellRare = {
      sp = "orange",
      undercurl = true
    },
  }
}

return M
