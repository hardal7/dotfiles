---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "jellybeans",
  theme_toggle = { "onedark", "one_light" },

  hl_override = {
    jellybeans = {bg = "#0d0d15"}
  },
  hl_add = highlights.add,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
