return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				rust = { "rustfmt", lsp_format = "fallback" },
				json = { "biome" },
				javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
				typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
				cs = { "csharpier", timeout_ms = 10000 },
			},
		})
	end,
}
