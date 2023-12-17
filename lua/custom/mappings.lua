---@type MappingsTable
local M = {}

M.general = {
  x = {
    ["<leader>ri"] = {
      function()
        require("refactoring").refactor "Inline Variable"
      end,
      "Inline Variable",
    },
    ["<leader>re"] = {
      function()
        require("refactoring").refactor "Extract Function"
      end,
      "Extract Function",
    },
    ["<leader>rf"] = {
      function()
        require("refactoring").refactor "Extract Function To File"
      end,
      "Extract Function To File",
    },
    ["<leader>rv"] = {
      function()
        require("refactoring").refactor "Extract Variable"
      end,
      "Extract Variable",
    },
  },
  n = {
    ["<leader>re"] = {
      function()
        require("refactoring").refactor "Extract Function"
      end,
      "Extract Function",
    },
    ["<leader>rf"] = {
      function()
        require("refactoring").refactor "Extract Function To File"
      end,
      "Extract Function To File",
    },
    ["<leader>rv"] = {
      function()
        require("refactoring").refactor "Extract Variable"
      end,
      "Extract Variable",
    },
    ["<leader>ri"] = {
      function()
        require("refactoring").refactor "Inline Variable"
      end,
      "Inline Variable",
    },
    ["<leader>rI"] = {
      function()
        require("refactoring").refactor "Inline Function"
      end,
      "Inline Function",
    },
    ["<leader>rb"] = {
      function()
        require("refactoring").refactor "Extract Block"
      end,
      "Extract Block",
    },
    ["<leader>rbf"] = {
      function()
        require("refactoring").refactor "Extract Block To File"
      end,
      "Extract Block To File",
    },

    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-d>"] = { "<C-d>zz", "page down" },
    ["<C-u>"] = { "<C-u>zz", "page up" },
    ["<leader>a"] = {
      function()
        require("harpoon"):list():append()
      end,
      "Add current file to harpoon list",
    },
    ["<C-e>"] = {
      function()
        local harpoon = require "harpoon"
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      "Toggle harpoon quick menu",
    },
    ["<A-n>"] = {
      function()
        require("harpoon"):list():select(1)
      end,
      "Open harpoon first bookmark",
    },
    ["<A-m>"] = {
      function()
        require("harpoon"):list():select(2)
      end,
      "Open harpoon second bookmark",
    },
    ["<A-j>"] = {
      function()
        require("harpoon"):list():select(3)
      end,
      "Open harpoon third bookmark",
    },
    ["<A-k"] = {
      function()
        require("harpoon"):list():select(4)
      end,
      "Open harpoon fourth bookmark",
    },
  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", "move line down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "move line up" },
  },
}

-- more keybinds!

return M
