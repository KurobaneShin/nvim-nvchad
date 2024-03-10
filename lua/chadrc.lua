---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "highlights"

M.ui = {
  theme = "chadracula-evondev",
  theme_toggle = { "chadracula-evondev", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

for i = 1, 9, 1 do
  vim.keymap.set("n", string.format("<A-%s>", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end

-- = "plugins"

-- check core.mappings for table structure
-- = require "mappings"

return M
