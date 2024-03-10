local options = {
  lsp_fallback = true,
  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 500,
  },
  formatters_by_ft = {
    lua = { "stylua" },
  },
}


require("conform").setup(options)
