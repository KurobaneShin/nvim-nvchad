local conform = require "conform"

local formatterByFileTypes = {
  javascript = { "biome", "eslint_d", "prettier", "deno_fmt" },
  javascriptreact = { "biome", "eslint_d", "prettier", "deno_fmt" },
  typescript = { "biome", "eslint_d", "prettier", "deno_fmt" },
  typescriptreact = { "biome", "eslint_d", "prettier", "deno_fmt" },
}

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    conform.format { bufnr = args.buf }
  end,
})

conform.setup {
  formatter_by_ft = formatterByFileTypes,
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}
