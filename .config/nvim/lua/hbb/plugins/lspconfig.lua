return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")

		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
		local on_attach = require("hbb.utils.lsp").on_attach

		-- configure lua server (with special settings)
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
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
		})

		-- configure json for formatting
		lspconfig.jsonls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			init_options = {
				provideFormatter = true,
			},
		})

		-- @dependency {https://github.com/razzmatazz/csharp-language-server}
		-- @dependency {export DOTNET_ROOT & export DOTNET_TOOLS}
		lspconfig.csharp_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.zls.setup({})
	end,
}
