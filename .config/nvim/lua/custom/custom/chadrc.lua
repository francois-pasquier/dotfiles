local M = {}
local override = require "custom.override"

M.mappings = require "custom.mappings"

local highlights = require "custom.highlights"

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
  theme = "gruvbox",
  transparency = true,
  hl_override = highlights.override,
  hl_add = highlights.add
}

return M
