require "nvchad.mappings"
require "configs.mappings.harpoon"
require "configs.mappings.tmuxNavigator"
require "configs.mappings.refactoring"
require "configs.mappings.gitConflict"
require "configs.mappings.go"

local map = vim.keymap.set

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", ";", ":", { nowait = true })
map("v", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Goto Definition" })
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Goto Definition" })
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Goto Declaration" })
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Goto References" })
