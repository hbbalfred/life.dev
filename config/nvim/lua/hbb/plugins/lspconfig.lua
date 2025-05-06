return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"saghen/blink.cmp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function(_, opts)
		local lspconfig = require("lspconfig")

		for server, config in pairs(opts.servers) do
			-- config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			config.on_attach = require("hbb.utils.lsp").on_attach
			lspconfig[server].setup(config)
		end
	end,
	opts = {
		servers = {
			lua_ls = {
				settings = { -- custom settings for lua
					Lua = {
						-- make the language server recognize "vim" global
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							-- make language server aware of runtime files
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			},
			jsonls = {
				init_options = {
					provideFormatter = true,
				},
			},
			csharp_ls = {},
			pylsp = {},
		},
	},
}
