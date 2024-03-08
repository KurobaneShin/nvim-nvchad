local lint = require "lint"

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

lint.linters_by_ft = {
  typescript = { "biomejs", "eslint_d", "eslint" },
  javascript = { "biomejs", "eslint_d", "eslint" },
  typescriptreact = { "biomejs", "eslint_d", "eslint" },
  javascriptreact = { "biomejs", "eslint_d", "eslint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})
