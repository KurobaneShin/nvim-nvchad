local conform = require "conform"

local formatterByFileTypes = {
  javascript = { { "biome", "eslint_d", "prettier", "deno_fmt" } },
  javascriptreact = { { "biome", "eslint_d", "prettier", "deno_fmt" } },
  typescript = { { "biome", "eslint_d", "prettier", "deno_fmt" } },
  typescriptreact = { { "biome", "eslint_d", "prettier", "deno_fmt" } },
  go = { "gofumpt", "goimports-reviser" },
  lua = { "stylua" },
  c = { "clang_format" },
}

-- vim.keymap.set({"v","n"},"<leader>fm",function ()
--   conform.format({
--     lsp_fallback = true,
--     async = false,
--     timeout_ms = 500,
--   })
-- end)

conform.setup {
  formatter_by_ft = formatterByFileTypes,
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  },
  log_level = vim.log.levels.DEBUG,

  format_after_save = {
    lsp_fallback = true,
  },

  notify_on_error = true,
}
