local map = vim.keymap.set

map("n", "<leader>gct", "<cmd>GitConflictChooseTheirs<CR>")
map("n", "<leader>gco", "<cmd>GitConflictChooseOurs<CR>", { noremap = true, silent = true })
map("n", "<leader>gcb", "<cmd>GitConflictChooseBoth<CR>", { noremap = true, silent = true })
map("n", "<leader>gcn", "<cmd>GitConflictNextConflict<CR>", { noremap = true, silent = true })
map("n", "<leader>gcp", "<cmd>GitConflictPrevConflict<CR>", { noremap = true, silent = true })
