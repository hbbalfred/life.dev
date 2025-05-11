return {
	"mrcjkb/rustaceanvim",
	version = "^6",
	lazy = false,
	init = function()
		vim.g.rustfmt_autosave = 1
		vim.g.rustaceanvim = {
			server = {
				on_attach = require("hbb.utils.lsp").on_attach,
				settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
						},
					},
				},
			},
		}
	end,
}
