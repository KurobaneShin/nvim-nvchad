require "nvchad.mappings"
require "configs.mappings.harpoon"
require "configs.mappings.tmuxNavigator"
require "configs.mappings.refactoring"
require "configs.mappings.gitConflict"
require "configs.mappings.go"

local map = vim.keymap.set

map("n", "M", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "hover definition" })
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", ";", ":", { nowait = true })
map("v", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Goto Definition" })
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Goto Definition" })
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Goto Declaration" })
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Goto References" })
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")
map("x", "<leader>p", '"_dP')
map("n", "<leader>tbg", function()
  require("base46").toggle_transparency()
end, { desc = "toggle transparency" })
