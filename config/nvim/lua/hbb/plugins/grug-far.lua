return {
	"MagicDuck/grug-far.nvim",
	config = function()
		require("grug-far").setup({
			-- options, see Configuration section below
			-- there are no required options atm
			-- engine = 'ripgrep' is default, but 'astgrep' can be specified
		})
	end,
	keys = {
		{
			"<leader>ra",
			function()
				require("grug-far").open({
					prefills = {
						search = vim.fn.expand("<cword>"),
					},
				})
			end,
			desc = "Replace with the current word",
		},
	},
}
