return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require("mason")
		mason.setup({})

		local mason_lspconfig = require("mason-lspconfig")
		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"lua_ls",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = false, -- not the same as ensure_installed
		})
	end,
}
