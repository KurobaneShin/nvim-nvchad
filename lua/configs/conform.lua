local options = {
	lsp_fallback = true,
	format_on_save = {
		lsp_fallback = true,
		timeout_ms = 500,
	},
	formatters_by_ft = {
		javascript = { { "biome", "eslint_d", "prettier", "deno_fmt" } },
		javascriptreact = { { "biome", "eslint_d", "prettier", "deno_fmt" } },
		typescript = { { "biome", "eslint_d", "prettier", "deno_fmt" } },
		typescriptreact = { { "biome", "eslint_d", "prettier", "deno_fmt" } },
		go = { "gofumpt", "goimports-reviser" },
		lua = { "stylua" },
	},
}

require("conform").setup(options)
