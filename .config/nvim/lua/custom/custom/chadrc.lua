local M = {}
local override = require "custom.override"

M.mappings = require "custom.mappings"

M.plugins = {
  override = {
    ["williamboman/mason.nvim"] = override.mason,
    ["hrsh7th/nvim-cmp"] = override.cmp,
    ["folke/which-key"] = {
      disable = false
    },
  },
  user = require("custom.plugins"),
}

M.ui = {
  -- theme = "gruvbox",
  theme = "gruvbox",
  transparency = true,
  hl_override = require "custom.highlights"
}

return M
