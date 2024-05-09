local webdevFormatter = function(bufnr)
  if require("conform").get_formatter_info("biome", bufnr).available then
    return { "biome", "biome-check" }
  elseif require("conform").get_formatter_info("eslint_d", bufnr).available then
    return { "prettier", "eslint_d" }
  else
    return { "deno_fmt" }
  end
end

local options = {
  format_on_save = {
    timeout_ms = 5000,
    lsp_fallback = true,
  },
  format_after_save = {
    lsp_fallback = true,
  },
  log_level = vim.log.levels.ERROR,
  notify_on_error = false,
  formatters = {
    ["goimports-reviser"] = {
      args = { "-rm-unused", "-set-alias", "-format", "$FILENAME" },
    },
  },
  formatters_by_ft = {
    javascript = webdevFormatter(bufnr),
    javascriptreact = webdevFormatter(bufnr),
    typescript = webdevFormatter(bufnr),
    typescriptreact = webdevFormatter(bufnr),
    go = { "goimports-reviser", "gofumpt" },
    lua = { "stylua" },
  },
}

require("conform").setup(options)
