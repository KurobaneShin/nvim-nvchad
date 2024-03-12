local webdevFormatter = function(bufnr)
  if require("conform").get_formatter_info("biome", bufnr).available then
    return { "biome", "biome-check" }
  else
    return { "prettier", "eslint_d" }
  end
end

local options = {
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
  format_after_save = {
    lsp_fallback = true,
  },
  log_level = vim.log.levels.ERROR,
  notify_on_error = false,
  formatters_by_ft = {
    javascript = webdevFormatter(bufnr),
    javascriptreact = webdevFormatter(bufnr),
    typescript = webdevFormatter(bufnr),
    typescriptreact = webdevFormatter(bufnr),
    go = { "gofumpt", "goimports-reviser" },
    lua = { "stylua" },
  },
}

require("conform").setup(options)
