local lint = require "lint"

  local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
  
lint.linters_by_ft = {
    typescript = { "biomejs" },
    javascript = { "biomejs" },
    typescriptreact = { "biomejs" },
    javascriptreact = { "biomejs" },
  }


  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    group = lint_augroup,
    callback = function()
      lint.try_lint()
    end,
  })