---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "highlights"

M.ui = {
  theme = "penumbra_dark",
  theme_toggle = { "penumbra_light", "penumbra_dark" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  cmp = {
    icons = true,
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
  },

  statusline = {
    theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",
    order = nil,
    modules = nil,
  },
  tabufline = {
    enabled = false,
  },
}

vim.keymap.set("n", "<leader>tt", function()
  require("base46").toggle_theme()
end, { desc = "toggle theme" })

for i = 1, 9, 1 do
  vim.keymap.set("n", string.format("<A-%s>", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end

-- = "plugins

-- check core.mappings for table structure
-- = require "mappings"

return M
